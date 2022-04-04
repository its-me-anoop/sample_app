part of 'graph_bloc.dart';

abstract class GraphState extends Equatable {
  const GraphState();
}

//Initial state while fetching data from the API
class GraphLoadingState extends GraphState {
  @override
  List<Object> get props => [];
}

//Data fetch from API is complete
class GraphLoadedState extends GraphState {
  final List<Datum> data;

  const GraphLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
