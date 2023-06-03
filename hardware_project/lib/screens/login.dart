import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hardware_project/screens/admin.dart';
import 'package:hardware_project/screens/customer.dart';
import 'package:hardware_project/screens/sharedPrefs.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'signup.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late TextEditingController emailController;
  late TextEditingController passController;
  bool pass = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/login.png"), fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0, // soften the shadow
                                spreadRadius: 5.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 5  horizontally
                                  2.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Image.asset("assets/logo.png"),
                        )
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                        controller: emailController,
                        cursorColor: Colors.black,
                        textAlign: TextAlign.left,
                        decoration: ThemeHelper().textInputDecoration(
                            Icons.mail, "Email", "Enter your email ..")),
                  )
                ])),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                        controller: passController,
                        cursorColor: Colors.black,
                        obscureText: pass,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password ..',
                            suffixIcon: InkWell(
                              onTap: _togglePass,
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            labelStyle: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.red, width: 2.0)))),
                  )
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot your password ?',
                              style: TextStyle(
                                fontFamily: 'El Messiri',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            )),
                      )
                    ]))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: InkWell(
                        onTap: () {
                          loginFunc();
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Colors.deepOrange, Colors.orange],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Login",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 24))
                            ],
                          ),
                        ),
                      ))
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                      },
                      child: Text(
                        'Create new account',
                        style: TextStyle(
                          fontFamily: 'El Messiri',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )),
                ))
          ],
        ));
  }

  void _togglePass() {
    setState(() {
      pass = !pass;
    });
  }

  Future<void> loginFunc() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Empty Feild !',
        desc: 'Enter your email and password',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Color.fromARGB(255, 196, 27, 15),
      ).show();
      return;
    }

    var body = jsonEncode({
      "email": emailController.text,
      "password": passController.text,
    });
    var res = await http.post(Uri.parse(baseUrl + "/users/login"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      sharedPrefs.saveToken(body['token']);
      print("done");
      clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => customer()),
      );
    } else if (emailController.text == "roaa.barq@gmail.com" &&
        passController.text == "1111") {
      print("done");
      clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => admin()),
      );
    } else
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Faild !',
        desc: 'Check your email or password is correct',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Color.fromARGB(255, 196, 27, 15),
      ).show();
  }

  void clear() {
    emailController.text = "";
    passController.text = "";
  }
}
