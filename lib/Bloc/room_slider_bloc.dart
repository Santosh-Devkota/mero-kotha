import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/model/property.dart';

import '../conf.dart';

abstract class RoomSliderEvents {}

abstract class RoomSliderStates {}

class PremiumRoomsLoadEvent extends RoomSliderEvents {
  final depsId;
  PremiumRoomsLoadEvent(this.depsId);
}

class SliderInitialState extends RoomSliderStates {}

class PremiumRoomsLoadingState extends RoomSliderStates {}

class PremiumRoomsLoadedState extends RoomSliderStates {
  List<Property> premiumRooms;
  PremiumRoomsLoadedState(this.premiumRooms);
}

class PremiumRoomsLoadFailedState extends RoomSliderStates {}

class RoomSliderBloc extends Bloc<RoomSliderEvents, RoomSliderStates> {
  RoomSliderBloc(RoomSliderStates initialState) : super(initialState);

  List<Property> rooms;
  @override
  Stream<RoomSliderStates> mapEventToState(RoomSliderEvents event) async* {
    if (event is PremiumRoomsLoadEvent) {
      if (rooms != null) {
        yield PremiumRoomsLoadedState(rooms);
      } else {
        yield PremiumRoomsLoadingState();
        Dio dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            headers: {"apiKey": apiKey},
            validateStatus: (status) => true));
        final _dioCacheManager = DioCacheManager(CacheConfig());
        Options _cacheOptions =
            buildCacheOptions(Duration(days: 7), forceRefresh: true);
        dio.interceptors.add(_dioCacheManager.interceptor);
        var response = await dio.get("properties/bydep/latest/${event.depsId}",
            options: _cacheOptions);
        if (response.statusCode == 200) {
          // for (var cat in response.data["data"]) {
          // if (cat["isActive"]) {
          //   rooms.add(Property.fromMap(cat));
          // }
          // }
          response.data["data"].forEach((e) {
            if (e["isActive"]) {
              rooms.add(Property.fromJson(e));
            }
          });
          yield PremiumRoomsLoadedState(rooms);
        } else {
          yield PremiumRoomsLoadFailedState();
        }
      }
    }
  }
}
