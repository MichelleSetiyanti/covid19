import 'package:covid19/pages/home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Covid- 19 App',
      // theme: ThemeData(
      //   primarySwatch: Colors.grey,
      // ),
      home: PagePertama(),
    );
  }
}
