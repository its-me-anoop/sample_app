import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/data_model.dart';
import '../../services/api_service.dart';

part 'graph_event.dart';
part 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  final ApiService _apiService;
  GraphBloc(this._apiService) : super(GraphLoadingState()) {
    on<LoadGraphEvent>((event, emit) async {
      //Fetch data from the API
      final result = await _apiService.finalList();

      //Pass Graph loaded state once the data fetch is complete
      emit(GraphLoadedState(result));
    });
  }
}
