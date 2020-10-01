import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mero_kotha/model/department.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';
import "../conf.dart";

abstract class HomeDepartmentStates {}

abstract class HomeDepartmentEvents {}

class DepartmentInitialState extends HomeDepartmentStates {}

class DepartmentLoadingState extends HomeDepartmentStates {}

class DepartmentLoadedState extends HomeDepartmentStates {
  final List<Department> department;
  DepartmentLoadedState(this.department);
}

class DepartmentLoadEvent extends HomeDepartmentEvents {}

class HomeDepartmentBloc
    extends Bloc<HomeDepartmentEvents, HomeDepartmentStates> {
  HomeDepartmentBloc(HomeDepartmentStates initialState) : super(initialState);
  List<Department> departments;
  @override
  HomeDepartmentStates get intialState => DepartmentInitialState();
  @override
  Stream<HomeDepartmentStates> mapEventToState(
      HomeDepartmentEvents event) async* {
    if (event is DepartmentLoadEvent) {
      if (departments != null && departments.length > 0) {
        yield DepartmentLoadedState(this.departments);
      } else {
        yield DepartmentLoadingState();
        //send http request to server
        Dio dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            headers: {"apiKey": apiKey},
            validateStatus: (status) => true));
        final _dioCacheManager = DioCacheManager(CacheConfig());
        Options _cacheOptions =
            buildCacheOptions(Duration(days: 7), forceRefresh: true);
        departments = List<Department>();
        dio.interceptors.add(_dioCacheManager.interceptor);
        var response = await dio.get("department/", options: _cacheOptions);
        if (response.statusCode == 200) {
          for (var cat in response.data) {
            //adding only the active catgories
            if (cat["isActive"]) {
              departments.add(Department.fromMap(cat));
            }
          }
          yield DepartmentLoadedState(departments);
        }
      }
    }
  }
}
