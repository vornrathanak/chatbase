import 'package:firebase_demo/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      // initialRoute: '/login',
      // routes: {
      //   '/':(context)=>const Home(),
      //   '/login':(context)=>const Login(),
      //   '/reset':(context)=>const Reset(),
      //   '/register':(context)=>const Register(),
      // },
    );
  }
}





