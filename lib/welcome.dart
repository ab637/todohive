import 'package:flutter/material.dart';
class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            )
        ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),

        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
         const    Text("Hi, are you ready to crush your day", style: TextStyle(fontSize: 15, color: Colors.white),),
            SizedBox(height: 50,),
            Text("This is the last to-do List you will ever need",style: TextStyle(fontSize: 15, color: Colors.white)),


          ],

        ),

      ),
      ),

    );
  }
}
