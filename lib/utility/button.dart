import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
   myButton({
    super.key,
    required this.text,
    required this.onpressed,
});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onpressed,
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white),),
      color: Theme.of(context).primaryColor,
    );
  }
}

