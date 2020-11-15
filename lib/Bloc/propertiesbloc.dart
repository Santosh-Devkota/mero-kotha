import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/model/property.dart';

import '../conf.dart';

abstract class PropertyDataStates {}

abstract class PropertyDataEvents {}

class PropertyDataInitialState extends PropertyDataStates {}

class PropertyDataLoadingState extends PropertyDataStates {}

class PropertyDataLoadedState extends PropertyDataStates {
  final List<Property> propeties;

  PropertyDataLoadedState(this.propeties);
}

class PropertyDataLoadingErrorState extends PropertyDataStates {
  final String errorMessage;

  PropertyDataLoadingErrorState(this.errorMessage);
}

class PropertyDataLoadEvent extends PropertyDataEvents {
  final String depId;
  PropertyDataLoadEvent(this.depId);
}

class PropertyDataBloc extends Bloc<PropertyDataEvents, PropertyDataStates> {
  PropertyDataBloc(PropertyDataStates initialState) : super(initialState);
  List<Property> properties = [];

  @override
  Stream<PropertyDataStates> mapEventToState(PropertyDataEvents event) async* {
    if (event is PropertyDataLoadEvent) {
    yield  PropertyDataLoadingState();
      final depId = event.depId;
      Dio dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          headers: {"apiKey": apiKey},
          validateStatus: (status) => true));
      try {
        var response = await dio.get("properties/bydep/$depId");
        if (response.statusCode == 200) {
          for (var data in response.data['data']) {
            properties.add(Property.fromJson(data));
          }
         yield PropertyDataLoadedState(properties);
        } else {
          yield PropertyDataLoadingErrorState("Server Error");
        }
      } catch (e) {
        yield PropertyDataLoadingErrorState("Internet Error");
      }
    }
  }
}
