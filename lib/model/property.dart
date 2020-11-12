import 'package:mero_kotha/conf.dart';

class Property {
  String id;
  String user;
  String department;
  bool isActive;
  int price;
  int availableQuantity;
  bool hasInternet;
  String water;
  int size;
  List<String> photos;
  List<String> phone;
  String location;
  Property.fromMap(Map<String, dynamic> map) {
    try {
      this.id = map["_id"];
      this.user = map["owner"];
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
