import 'package:flutter/material.dart';

class Utils{
 static showStateDialog(BuildContext context,String dialogText){
    showDialog(context: context, builder: (context) {
return AlertDialog(content: Text(dialogText),);
    },);
  }
  static showSnackBar(){

  }
}