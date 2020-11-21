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
  List<String> photos=[];
  List<String> phone=[];
  String location;
  Property.fromJson(Map<String, dynamic> map) {
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
     
      for(var p in map['photos']){
        photos.add(p);
      }
        for(var p in map['phone']){
        phone.add(p.toString());
      }
      // put photos map here *******
   
     // this.location = map["location"]['latitude'];
    } catch (e) {}
  }
}
