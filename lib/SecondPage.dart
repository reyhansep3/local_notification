import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3ffe2),
      appBar: AppBar(
        backgroundColor: Colors.black12 ,
        title: Text("Enjoy your lunch"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Container(
                child: new Image.network('https://mir-s3-cdn-cf.behance.net/project_modules/fs/37e19c53319193.592ffe63763e0.gif'),
              ),
            ),
            SizedBox(height: 20,),
            Text("Please Enjoy The Taco Burger Animation While You Eat :)")
          ],
        ),
      ),
    );
  }
}