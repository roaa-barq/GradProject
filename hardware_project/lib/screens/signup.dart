import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hardware_project/screens/customer.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../constants.dart';
import 'login.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passController;
  late TextEditingController repassController;
  bool pass = true;
  bool repass = true;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
    repassController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Colors.deepOrange, Colors.orange],
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Center(
                child: Text('Create New Account',
                    style: TextStyle(
                      fontFamily: 'El Messiri',
                      fontSize: 35,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      //
                    ))),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 1.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                          controller: nameController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.left,
                          decoration: ThemeHelper().textInputDecoration(
                              Icons.perm_identity,
                              "Name",
                              "Enter your full name ..")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                          controller: emailController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.left,
                          decoration: ThemeHelper().textInputDecoration(
                              Icons.mail_outline_outlined,
                              "Email",
                              "Enter your email ..")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                          controller: phoneController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.left,
                          decoration: ThemeHelper().textInputDecoration(
                              Icons.phone_android,
                              "Phone Number",
                              "Enter your phone number")),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                          controller: repassController,
                          cursorColor: Colors.black,
                          obscureText: repass,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 'Confirm your password ..',
                              suffixIcon: InkWell(
                                onTap: _retogglePass,
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: InkWell(
                        onTap: () {
                          signUp();
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
                              Text("Create Account",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 24))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          },
                          child: Text(
                            'Have an account ? Login',
                            style: TextStyle(
                              fontFamily: 'El Messiri',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )),
                    )
                  ])),
            ]),
          ],
        ));
  }

  void _togglePass() {
    setState(() {
      pass = !pass;
    });
  }

  void _retogglePass() {
    setState(() {
      repass = !repass;
    });
  }

  Future<void> signUp() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passController.text.isEmpty ||
        repassController.text.isEmpty) {
      print("empty fields");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Faild !',
        desc: 'Empty Field !',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Color.fromARGB(255, 196, 27, 15),
      ).show();
      return;
    }
    if (passController.text != repassController.text) {
      print("no match");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Faild !',
        desc: "Passwords don't match",
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Color.fromARGB(255, 196, 27, 15),
      ).show();
      return;
    }
    var body = jsonEncode({
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passController.text,
    });
    var res = await http.post(Uri.parse(baseUrl + "/users"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    if (res.statusCode == 201) {
      print("done");
      clear();
      AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        showCloseIcon: true,
        title: 'Success',
        desc: 'New account has been created',
        btnOkOnPress: () {
          debugPrint('OnClcik');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => customer()),
          );
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    } else
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: true,
        title: 'Faild  !',
        desc: 'Try another one',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Color.fromARGB(255, 196, 27, 15),
      ).show();
  }

  void clear() {
    nameController.text = "";
    phoneController.text = "";
    emailController.text = "";
    passController.text = "";
    repassController.text = "";
  }
}
