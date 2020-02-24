import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is InitHomeEvent) {
      yield LoadingHomeState();
      await Future.delayed(Duration(seconds: 1));
      yield DataHomeState([
        'Limpieza',
        'Plomería',
        'Climatización',
        'Eléctrico',
        'Servicio técnico',
        'Seguridad'
      ]);
    }
  }
}

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class DataHomeState extends HomeState {
  final List<String> services;

  DataHomeState(this.services);
}

abstract class HomeEvent {}

class InitHomeEvent extends HomeEvent {}
