import 'dart:ffi';

import 'package:mero_kotha/conf.dart';

class Department {
  String id;
  String name;
  String icon;
  int totalItems;
  bool isActive;
  Department.fromMap(Map<String, dynamic> map) {
    this.id = map["_id"];
    this.name = map["name"];
    this.icon = imageUrl + map["icon"];
    this.totalItems = map["totalItems"];
    this.isActive = map["isActive"];
  }
}
