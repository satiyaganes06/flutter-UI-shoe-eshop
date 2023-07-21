import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Page/Dashboard/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
