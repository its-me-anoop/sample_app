part of 'graph_bloc.dart';

abstract class GraphEvent extends Equatable {
  const GraphEvent();
}

//Fetching data from the API
class LoadGraphEvent extends GraphEvent {
  @override
  List<Object> get props => [];
}
