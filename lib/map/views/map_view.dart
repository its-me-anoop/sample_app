import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

import '../../services/api_service.dart';
import '../bloc/map_bloc.dart';

class MapView extends StatelessWidget {
  const MapView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map View"),
      ),
      body: RepositoryProvider(
        create: (context) => ApiService(),
        child: BlocProvider(
          create: ((context) =>
              MapBloc(RepositoryProvider.of<ApiService>(context))
                ..add(LoadMapEvent())),
          child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
            //Fetching Api Data
            if (state is MapLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            //Completed fetching data from the Api
            if (state is MapLoadedState) {
              //Platform Map supports Google Map in Android and Apple Maps in ios devices
              //I have updated info.plist file for ios for the purpose of demo.
              //Not implemented for running on Android devices, since it required Api Key for Google Maps.
              //To set up for Android add the below lines of code in android/app/src/main/AndroidManifest.xml:
              //<manifest ...
              // <application ...
              //   <meta-data android:name="com.google.android.geo.API_KEY"
              //              android:value="YOUR KEY HERE"/>
              return PlatformMap(
                //Initial Camera Position
                initialCameraPosition: CameraPosition(
                  target: LatLng(state.data.first.lat, state.data.first.lon),
                  zoom: 16.0,
                ),

                //Markers for the first and last location of the path
                markers: <Marker>{
                  Marker(
                      markerId: MarkerId("Start"),
                      position:
                          LatLng(state.data.first.lat, state.data.first.lon)),
                  Marker(
                      markerId: MarkerId("End"),
                      position:
                          LatLng(state.data.last.lat, state.data.last.lon))
                },

                //Polyline drawn between the first and last location along with the LatLng from the api data
                polylines: {
                  Polyline(
                      polylineId: PolylineId('my_path'),
                      points:
                          state.data.map((e) => LatLng(e.lat, e.lon)).toList(),
                      color: Colors.red)
                },
                mapType: MapType.normal,
                compassEnabled: true, //not necessary
                onMapCreated: (controller) {
                  //Here is what happens once the map is created
                  Future.delayed(const Duration(seconds: 1)).then(
                    (_) {
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            bearing: 270.0,
                            target: LatLng(
                                state.data.last.lat, state.data.last.lon),
                            tilt: 30.0,
                            zoom: 18,
                          ),
                        ),
                      );
                      controller.getVisibleRegion();
                    },
                  );
                },
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
