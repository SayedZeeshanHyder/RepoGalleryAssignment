import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Sorry Couldnt Fetch Data. Check your Internet Connection"),
            ElevatedButton(onPressed: (){

            }, child: Text("Try Again"),),
          ],
        ),
      ),
    );
  }
}
