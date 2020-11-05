import 'package:flutter/material.dart';
import 'package:mero_kotha/model/department.dart';

class Facilities {
  String name;
  Icon icon;
  dynamic value;
  List<String> departments;
  int selectedIndex = 0;
  Facilities({this.name, this.icon, this.value, this.departments});
}
