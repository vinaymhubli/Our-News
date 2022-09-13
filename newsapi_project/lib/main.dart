import 'dart:io';
import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:newsapi_project/auth/auth.dart';
int? initScreen;
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
  Magic.instance = Magic("pk_live_194A920D3C3C29CA");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NEWS API APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.purple
      ),
      home: Stack(
        children: [
        AuthHome(),
        Magic.instance.relayer
        ],
      )    ,
    );
  }
}
