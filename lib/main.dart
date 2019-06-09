import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/views/mainform.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "GMC Manjeri Survey",
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black)
          ),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
          ),
          iconTheme: IconThemeData(color: Colors.black)
      ),
      home: MainForm(),
    );
  }
}