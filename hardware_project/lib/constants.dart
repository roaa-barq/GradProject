import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const background = Color.fromRGBO(254, 254, 254, 1);
const String baseUrl = "http://192.168.1.93:3080";

class ThemeHelper {
  Icon? icon;
  String? label;
  String? hint;
  InputDecoration textInputDecoration([icon, label, hint]) {
    return InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(
          icon,
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
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 2.0)));
  }
}

class ThemeHelper2 {
  Icon? icon;
  String? label;
  String? hint;
  InputDecoration textInputDecoration([label, hint]) {
    return InputDecoration(
        labelText: label,
        hintText: hint,
        fillColor: Colors.white,
        filled: true,
        labelStyle: TextStyle(
          fontFamily: 'El Messiri',
          fontSize: 18,
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
            borderSide: BorderSide(color: Colors.red, width: 2.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 2.0)));
  }
}
