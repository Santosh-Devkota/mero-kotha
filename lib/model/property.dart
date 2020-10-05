import 'package:mero_kotha/conf.dart';
import 'package:mero_kotha/model/department.dart';
import 'package:mero_kotha/model/location.dart';
import 'package:mero_kotha/model/user.dart';

class Property {
  String id;
  // User user;
  String user;
  // Department department;
  String department;
  bool isActive;
  int price;
  int availableQuantity;
  bool hasInternet;
  String water;
  int size;
  List<String> photos;
  List<String> phone;
  // Location location;
  String location;
  Property.fromMap(Map<String, dynamic> map) {
    try {
      this.id = map["_id"];
      //this.user = User.fromMap(map["owner"]);
      this.user = map["owner"];
      // this.department = Department.fromMap(map["department"]);
      this.department = map["department"];
      this.isActive = map["isActive"];
      this.price = map["price"];
      this.availableQuantity = map["available_quantity"];
      this.hasInternet = map["hasInternet"];
      this.water = map["water"];
      this.size = map["size"];
      this.photos = ((map["photos"]).map((e) => (imageUrl + e))).toList();
      this.phone = map["phone"];
      this.location = map["location"];
    } catch (e) {}
  }
}
