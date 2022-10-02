import 'package:flutter/material.dart';
import 'package:todohive/utility/button.dart';

class dialogBox extends StatelessWidget {
  // methods for save and cancel buttons
  VoidCallback onSave;
  VoidCallback onCancel;
  final controller;

   dialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),

          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,


            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(

                    border: OutlineInputBorder(), hintText: "Add a new task",

                ),

              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  myButton(text: "Save", onpressed: onSave),
                  const SizedBox(width: 15),
                  myButton(text: "Cancel", onpressed: onCancel)],

              )
              // BUTTON FOR SAVING ANND CANCEL
            ],
          )),
    );
  }
}
