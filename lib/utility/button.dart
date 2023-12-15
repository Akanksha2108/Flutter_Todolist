import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  
  VoidCallback onpressed;
  final String text;
  
MyButton(
  {
  super.key,
  required this.text,
  required this.onpressed
  }
);


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: Colors.black12,
      color:Theme.of(context).primaryColor,
      child: Text(text),
      onPressed: onpressed
      );
  }
}
