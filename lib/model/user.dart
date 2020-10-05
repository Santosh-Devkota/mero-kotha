class User {
  String name;
  String email;
  int phone;
  User.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.email = map["email"];
    this.phone = map["phone"];
  }
}
