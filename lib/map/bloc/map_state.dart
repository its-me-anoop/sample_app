part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();
}

//Initial State while fetching data from the Api
class MapLoadingState extends MapState {
  @override
  List<Object> get props => [];
}

//Data fetch completed
class MapLoadedState extends MapState {
  final List<Datum> data;

  const MapLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}
