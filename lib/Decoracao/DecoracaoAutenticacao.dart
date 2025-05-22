import 'package:flutter/material.dart';

InputDecoration getAutenticationInputDecoration(String label) {
  return InputDecoration(
    label: Text(label),
    fillColor: Colors.white,
    filled: true,
    labelStyle: TextStyle(color: Colors.blueAccent),

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.black, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.blueAccent, width: 3),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.red, width: 3),
    ),
  );
}
