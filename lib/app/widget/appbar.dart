import 'package:flutter/material.dart';

class SmartyAppBar extends AppBar {
  SmartyAppBar({String titleText})
      : super(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(titleText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.w900)),
        );
}
