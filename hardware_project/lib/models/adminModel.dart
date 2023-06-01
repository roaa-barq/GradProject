class adminModel {
  late String email;
  late String name;
  late String phone;
  late String password;
  late String id;

  adminModel(this.email, this.name, this.phone, this.id);

  adminModel.fromJson(Map<String, dynamic> map) {
    this.email = map['email'];
    this.name = map['name'];
    this.phone = map['phone'];
    this.id = map['_id'];
    this.password = map['password'];
  }
}
