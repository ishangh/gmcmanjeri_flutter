import 'package:flutter/material.dart';

class Export extends StatelessWidget {
  static const String routeName = "/export";
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Export to SpreadSheet"),
      ),
      body: new Container(
        child: new Center(
        child: new Text("Export to SpreadSheet",
          textDirection: TextDirection.ltr,
			    style: TextStyle(color: Colors.black, fontSize: 40.0),
        ),
      ))
    );
  }
}