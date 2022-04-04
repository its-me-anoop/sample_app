import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/data_model.dart';
import '../../services/api_service.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final ApiService _apiService;
  MapBloc(this._apiService) : super(MapLoadingState()) {
    on<LoadMapEvent>((event, emit) async {
      //Fetch data from the API
      final result = await _apiService.finalList();

      //Pass Map loaded state once the data fetch is complete
      emit(MapLoadedState(result));
    });
  }
}
