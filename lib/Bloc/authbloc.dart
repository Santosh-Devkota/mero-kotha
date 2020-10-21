import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mero_kotha/model/user.dart';

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

class InitializeAuthEvent extends AuthEvents {}

class AuthLogoutEvent extends AuthEvents {}

class AuthFacebookLogin extends AuthEvents {
  final String accessToken;
  AuthFacebookLogin(this.accessToken);
}

class AuthNotLoggedInState extends AuthStates {}

class AuthLoggedInState extends AuthStates {
  final User user;
  AuthLoggedInState({this.user});
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
  User user;
  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  Stream<AuthStates> mapEventToState(AuthEvents event) async* {
    if (event is InitializeAuthEvent) {
      //fetch user from db

      var email = await storage.read(key: "email");

      if (email == null) {
        AuthNotLoggedInState();
      } else {
        user = User();
        user.email = email;
        user.name = await storage.read(key: "name");
        user.token = await storage.read(key: "token");
        // var admin = await storage.read(key: "admin");
        // user.isAdmin = admin == "true" ? true : false;
        yield AuthLoggedInState(user: user);
      }
    } else if (event is AuthLoginEvent) {
      yield AuthTryingState();
      try {
        Dio dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            headers: {"apiKey": apiKey},
            validateStatus: (status) => true));
        var response = await dio.post("account/login",
            data: {"email": event.email, "password": event.password});
        if (response.statusCode == 200) {
          FlutterSecureStorage storage = FlutterSecureStorage();
          user = User();
          user.email = response.data["email"];
          user.name = response.data["name"];
          user.token = response.data["token"];
          yield AuthLoggedInState(user: user);
          await storage.write(key: "email", value: user.email);
          await storage.write(key: "token", value: user.token);
          await storage.write(key: "name", value: user.name);
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
          FlutterSecureStorage storage = FlutterSecureStorage();
          user = User();
          user.email = response.data["email"];
          user.name = response.data["name"];
          user.token = response.data["token"];
          yield AuthLoggedInState(user: user);
          await storage.write(key: "email", value: user.email);
          await storage.write(key: "token", value: user.token);
          await storage.write(key: "name", value: user.name);
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
      yield AuthNotLoggedInState();
      try {
        FlutterSecureStorage storage = FlutterSecureStorage();
        await storage.delete(key: "name");
        await storage.delete(key: "email");
        await storage.delete(key: "token");
      } catch (e) {}
    }
  }
}
