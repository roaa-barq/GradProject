class cabinetsModel {
  late String status;
  late String number;
  late String name;
  late String cod;
  late String pin;
  late String id;

  cabinetsModel(
      this.status, this.name, this.number, this.id, this.cod, this.pin);

  cabinetsModel.fromJson(Map<String, dynamic> map) {
    this.status = map['status'];
    this.name = map['name'];
    this.number = map['number'];
    this.id = map['_id'];
    this.pin = map['pin'];
    this.cod = map['cod'];
  }
}
