class packagesModel {
  late String name;
  late String cod;
  late String pin;
  late String id;
  late String status;

  packagesModel(this.cod, this.name, this.pin, this.id, this.status);

  packagesModel.fromJson(Map<String, dynamic> map) {
    this.cod = map['cod'];
    this.name = map['name'];
    this.id = map['_id'];
    this.pin = map['pin'];
    this.status = map['status'];
  }
}
