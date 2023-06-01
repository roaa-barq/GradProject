import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../main.dart';
import 'adminModel.dart';
import 'packagesModel.dart';
import 'userModel.dart';

class fetchData {
  var header = {"Authorization": "Bearer " + prefs.get("token").toString()};

  Future<userModel> fetchMyAccount() async {
    var res = await http.get(Uri.parse(baseUrl + "/users/me"), headers: header);

    var body = jsonDecode(res.body);
    userModel myAccount = userModel.fromJson(body);
    return myAccount;
  }

  Future<adminModel> fetchMyAccountAdmin() async {
    var res = await http.get(Uri.parse(baseUrl + "/admin/me"), headers: header);

    var body = jsonDecode(res.body);
    adminModel myAccount = adminModel.fromJson(body);
    return myAccount;
  }

  Future<packagesModel> fetchMyPackage() async {
    var res =
        await http.get(Uri.parse(baseUrl + "/packages/me"), headers: header);

    var body = jsonDecode(res.body);
    packagesModel myAccount = packagesModel.fromJson(body);
    return myAccount;
  }

  Future<List<packagesModel>> fetchAllPackages() async {
    var res = await http.get(Uri.parse(baseUrl + "/AllPackages"));
    var body = jsonDecode(res.body) as List<dynamic>;
    return body.map((packages) => packagesModel.fromJson(packages)).toList();
  }
}
