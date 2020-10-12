import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../conf.dart';

abstract class AuthEvents {}

abstract class AuthStates {}

class AuthInitializeEvent extends AuthEvents {}

class AuthLoginEvent extends AuthEvents {
  final String email;
  final String password;
  AuthLoginEvent({this.email, this.password});
}

class AuthRegisterEvent extends AuthEvents {
  final String email;
  final String password;
  final String name;

  AuthRegisterEvent({this.email, this.password, this.name});
}

class AuthLogoutEvent extends AuthEvents {}

class AuthFacebookLogin extends AuthEvents {
  final String accessToken;
  AuthFacebookLogin(this.accessToken);
}

class AuthNotLoggedInState extends AuthStates {}

class AuthLoggedInState extends AuthStates {
  final String email;
  final String name;
  final String token;
  AuthLoggedInState({this.email, this.name, this.token});
}

class AuthLoggedOutState extends AuthStates {}

class AuthLogoutTryingState extends AuthStates {}

class AuthLogOutFailedState extends AuthStates {}

class AuthRegisterSucessState extends AuthStates {}

class AuthTryingState extends AuthStates {}

class AuthFailedState extends AuthStates {
  final String errorMessage;

  AuthFailedState(this.errorMessage);
}

class AuthSuccessState extends AuthStates {}

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc(AuthStates initialState) : super(initialState);

  @override
  Stream<AuthStates> mapEventToState(AuthEvents event) async* {
    if (event is AuthLoginEvent) {
      yield AuthTryingState();
      try {
        Dio dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            headers: {"apiKey": apiKey},
            validateStatus: (status) => true));
        var response = await dio.post("account/login",
            data: {"email": event.email, "password": event.password});
        if (response.statusCode == 200) {
          var email = response.data["email"];
          var name = response.data["name"];
          var token = response.data["token"];
          yield AuthLoggedInState(email: email, name: name, token: token);
        } else if (response.statusCode == 401) {
          yield AuthFailedState(response.data["message"]);
        } else {
          yield AuthFailedState("Unknown error occured");
        }
      } catch (e) {}
    } else if (event is AuthFacebookLogin) {
      yield AuthTryingState();
      try {
        Dio dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            headers: {"apiKey": apiKey},
            validateStatus: (status) => true));
        var response = await dio.post("account/external-login",
            data: {"provider": "facebook", "token": event.accessToken});
        if (response.statusCode == 200) {
          var email = response.data["email"];
          var name = response.data["name"];
          var token = response.data["token"];
          yield AuthLoggedInState(email: email, name: name, token: token);
        } else if (response.statusCode == 401) {
          yield AuthFailedState(response.data["message"]);
        } else {
          yield AuthFailedState("Unknown error occured");
        }
      } catch (e) {}
    } else if (event is AuthRegisterEvent) {
      yield AuthTryingState();
      try {
        Dio dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            headers: {"apiKey": apiKey},
            validateStatus: (status) => true));
        var response = await dio.post("account/register", data: {
          "email": event.email,
          "password": event.password,
          "name": event.name
        });
        if (response.statusCode == 201) {
          yield AuthRegisterSucessState();
        } else if (response.statusCode == 401) {
          yield AuthFailedState(response.data["message"]);
        } else {
          yield AuthFailedState("Unknown error occured");
        }
      } catch (e) {}
    } else if (event is AuthLogoutEvent) {
      // yield AuthLoggedOutState();
      yield AuthLogoutTryingState();
    }
  }
}
