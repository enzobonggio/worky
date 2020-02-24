import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  // TODO: implement initialState
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is PressLoginButton) {
      yield LoadingLoginState();
      await Future.delayed(Duration(seconds: 2));
      yield SuccessLoginState();
    }
  }
}

abstract class LoginEvent {}

class PressLoginButton extends LoginEvent {}

abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}
