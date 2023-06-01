import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hardware_project/constants.dart';
import 'package:hardware_project/screens/login.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/fetchData.dart';
import '../models/packagesModel.dart';
import 'profileAdmin.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> with SingleTickerProviderStateMixin {
  fetchData _fetchData = fetchData();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
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
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height / 7,
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
                height: MediaQuery.sizeOf(context).height / 7,
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
                              fontWeight: FontWeight.bold)),
                    ]),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 20,
          ),
          fetchAllPackages()
        ],
      )),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => profileAdmin()));
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

  Widget packagesCard(String name, String status, String cod, String pin) {
    return Padding(
        padding: EdgeInsets.all(6),
        child: Padding(
            ///////////////// table
            padding: EdgeInsets.all(6),
            child: TextButton(
                onPressed: () {},
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          width: 25,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Text(
                          cod,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          width: 25,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Text(
                          pin,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          width: 25,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Text(
                          status,
                          style: TextStyle(
                            fontFamily: 'El Messiri',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ))))));
  }

  Future<void> LogoutAll() async {
    var header = {"Authorization": "Bearer " + prefs.get("token").toString()};

    var res = await http.post(Uri.parse(baseUrl + "/admin/logoutAll"),
        headers: header);
    if (res.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    }
  }

  Widget fetchAllPackages() {
    return FutureBuilder(
        future: _fetchData.fetchAllPackages(),
        builder: (context, snapchot) {
          var packages = snapchot.data as List<packagesModel>;
          return snapchot.data == null
              ? Text("جاري التحميل")
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // ignore: unnecessary_null_comparison
                  itemCount: packages == null ? 0 : packages.length,
                  itemBuilder: (context, index) {
                    return packagesCard(
                        packages[index].name,
                        packages[index].status,
                        packages[index].pin,
                        packages[index].cod);
                  });
        });
  }
}
