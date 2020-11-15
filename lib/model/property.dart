class Property {
  bool isActive;
  int avilableQuantity;
  bool hasInternet;
  bool hasParking;
  int size;
  List<String> photos;
  List<String> phone;
<<<<<<< HEAD
  String sId;
  int price;
  Location location;
  String department;
  String owner;
  String addedAt;
  int iV;

  Property(
      {this.isActive,
      this.avilableQuantity,
      this.hasInternet,
      this.hasParking,
      this.size,
      this.photos,
      this.phone,
      this.sId,
      this.price,
      this.location,
      this.department,
      this.owner,
      this.addedAt,
      this.iV});

  Property.fromJson(Map<String, dynamic> json) {
    try{
  
    isActive = json['isActive'];
    avilableQuantity = json['avilable_quantity'];
    hasInternet = json['hasInternet'];
    hasParking = json['hasParking'];
    size = json['size'];
    if (json['photos'] != null) {
      photos = new List<Null>();
      json['photos'].forEach((v) {
        photos.add(v);
      });
    }
    if (json['phone'] != null) {
      phone = new List<Null>();
      json['phone'].forEach((v) {
        phone.add(v);
      });
    }
    sId = json['_id'];
    price = json['price'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    department = json['department'];
    owner = json['owner'];
    addedAt = json['addedAt'];
    iV = json['__v'];
  }
    catch(e){}
=======
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
      // put photos map here *******
      this.phone = map["phone"];
      this.location = map["location"];
    } catch (e) {}
>>>>>>> aaffeb04f0e05524f3e850b0a2e1130026c723e1
  }
  

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['isActive'] = this.isActive;
  //   data['avilable_quantity'] = this.avilableQuantity;
  //   data['hasInternet'] = this.hasInternet;
  //   data['hasParking'] = this.hasParking;
  //   data['size'] = this.size;
  //   if (this.photos != null) {
  //     data['photos'] = this.photos.map((v) => v.toJson()).toList();
  //   }
  //   if (this.phone != null) {
  //     data['phone'] = this.phone.map((v) => v.toJson()).toList();
  //   }
  //   data['_id'] = this.sId;
  //   data['price'] = this.price;
  //   if (this.location != null) {
  //     data['location'] = this.location.toJson();
  //   }
  //   data['department'] = this.department;
  //   data['owner'] = this.owner;
  //   data['addedAt'] = this.addedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}

class Location {
  String latitude;
  String longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}