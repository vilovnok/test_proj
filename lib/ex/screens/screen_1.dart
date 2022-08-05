import 'dart:ui';

import 'package:flutter/material.dart';

class Screen_1 extends StatelessWidget {
  const Screen_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset('images/scr1.png'),
          ),
          btn('Log IN'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: btn('Sign UP'),
          ),
          Line(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image.asset('images/google.png'),
          ),
          Text(
            'with google',
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    );
  }
}

Widget btn(String text) {
  return FlatButton(
      height: 34,
      minWidth: 234,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      onPressed: () {});
}

Widget Line() {
  return Container(
    color: Colors.white,
    height: 2,
    width: 234,
  );
}
