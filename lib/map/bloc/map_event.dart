part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

//Fetch data from the Api and load Map
class LoadMapEvent extends MapEvent {
  @override
  List<Object> get props => [];
}
