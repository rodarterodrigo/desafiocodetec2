import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomFlutterToast{

  static Future<bool> alert (String message) async {
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 18.0
    );
  }
}