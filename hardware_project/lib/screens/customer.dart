import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hardware_project/constants.dart';
import 'package:hardware_project/screens/login.dart';
import 'package:hardware_project/screens/profileCustomer.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class customer extends StatefulWidget {
  const customer({super.key});

  @override
  State<customer> createState() => _customerState();
}

class _customerState extends State<customer> {
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
              'Daisy Store',
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
      backgroundColor: background,
      body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 15,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.1,
                child: Text(
                  "Welcome to the Daisy Store. Our application, the first of its kind in Palestine, offers the service of receiving your package from a free pick-up point, where you receive a secret code that only you own, and you enter it in the designated place installed on the cabinet when you go to receive your package.",
                  maxLines: 7,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 18,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    //
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 20,
              ),
              Divider(
                color: Colors.black,
                height: 25,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 5,
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pending",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 20,
                          ),
                          Text("number",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height / 5,
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.lightGreen, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Delivered",
                            style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 20,
                          ),
                          Text("number",
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))
                        ]),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 50,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 10,
                width: MediaQuery.sizeOf(context).width / 1.18,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.purple, Colors.deepOrange],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "COD",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 20,
                      ),
                      Text("number",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 50,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height / 10,
                width: MediaQuery.sizeOf(context).width / 1.18,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.purple, Colors.deepOrange],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "PIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 20,
                      ),
                      Text("number",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
            ],
          )),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => profileCustomer()));
            },
            child: const Text(
              'Profile',
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
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
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
}
