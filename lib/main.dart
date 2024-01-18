import 'package:flutter/material.dart';
import 'package:get_api_sample/Get_pages/getEmployeDetails.dart';
import 'package:get_api_sample/Home.dart';
import 'package:get_api_sample/post_pages/Add_Client_Details.dart';

import 'Get_pages/getClientDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home()
    );
  }
}
