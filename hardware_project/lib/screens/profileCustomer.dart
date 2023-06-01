import 'package:flutter/cupertino.dart';
import 'package:hardware_project/screens/customer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../constants.dart';
import '../main.dart';
import '../models/fetchData.dart';
import '../models/userModel.dart';
import 'login.dart';

class profileCustomer extends StatefulWidget {
  const profileCustomer({Key? key}) : super(key: key);

  @override
  State<profileCustomer> createState() => _profileCustomerState();
}

class _profileCustomerState extends State<profileCustomer> {
  bool pass = true;
  late TextEditingController nameController;
  late TextEditingController identityController;
  late TextEditingController phoneController;
  late TextEditingController passController;
  late TextEditingController repassController;
  fetchData _fetchData = fetchData();

  @override
  void initState() {
    super.initState();
    _fetchData.fetchMyAccount();
    nameController = TextEditingController();
    identityController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
    repassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Colors.deepOrange, Colors.orange],
            ),
          ),
        ),
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 2)),
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4.8,
            ),
            Text(
              'Profile Info',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              onPressed: () => _showActionSheet(context),
              icon: Icon(Icons.more_vert))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Image(
            image: AssetImage("assets/add.png"),
            height: 300,
            width: 400,
          ),
          myData(),
        ]),
      ),
    );
  }

  Widget myData() {
    return FutureBuilder(
      future: _fetchData.fetchMyAccount(),
      builder: (context, snapchot) {
        userModel data = snapchot.data as userModel;
        return snapchot.data == null
            ? Text("Loding..")
            : Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.mail,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Email: ' + data.email,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            //
                          )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.perm_identity,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Name: ' + data.name,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            //
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.phone_android,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Phone: ' + data.phone,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            //
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.lock_outline,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Password: ' + data.password,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            //
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                )
              ]);
      },
    );
  }

  void _togglePass() {
    setState(() {
      pass = !pass;
    });
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => customer()));
            },
            child: const Text(
              'Home',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              LogoutAll();
            },
            child: const Text(
              'Logout',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> LogoutAll() async {
    var header = {"Authorization": "Bearer " + prefs.get("token").toString()};

    var res = await http.post(Uri.parse(baseUrl + "/users/logoutAll"),
        headers: header);
    if (res.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }
}
