import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../conf.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ProperyEvents {}

abstract class PropertyStates {}

class PropertyAddingState extends PropertyStates {}

class PropertyAddEvent extends ProperyEvents {}

class PropertyBloc extends Bloc<ProperyEvents, PropertyStates> {
  PropertyBloc(PropertyStates initialState) : super(initialState);
  FlutterSecureStorage starage = new FlutterSecureStorage();

  @override
  Stream<PropertyStates> mapEventToState(ProperyEvents event) async* {
    var token = await starage.read(key: "token");
    Dio dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        headers: {"apiKey": apiKey, "Authorization": token},
        validateStatus: (status) => true));
    if (event is PropertyAddEvent) {
      yield PropertyAddingState();
    }
  }
}
