import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../map/views/map_view.dart';
import '../../services/api_service.dart';
import '../bloc/graph_bloc.dart';
import 'line_graph_view.dart';

class GraphView extends StatelessWidget {
  const GraphView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Graph View")),
      body: RepositoryProvider(
        create: (context) => ApiService(),
        child: BlocProvider(
          create: ((context) => GraphBloc(
                RepositoryProvider.of<ApiService>(context),
              )..add(LoadGraphEvent())),
          child: BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
            if (state is GraphLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GraphLoadedState) {
              return Column(children: [
                //Displays Combined Line Graph
                //SizedBox is used to determine the height and width of the graph
                SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: LineGraph(data: state.data)),

                //Button to navigate to the Map View
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MapView()));
                    },
                    child: const Text("Map View"))
              ]);
            }

            //Should return something. Using SizedBox to return empty widget
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
