import 'package:flutter/material.dart';

class SmartyRaisedButton extends RaisedButton {

  SmartyRaisedButton({String text, Function onClick}) : super(

      child: Text(text,
        style: TextStyle(fontSize: 20),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onPressed: onClick,
      textColor: Colors.white,
      color: Colors.black87
  );
}