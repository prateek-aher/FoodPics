import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/first_screen.dart';

class FoodPics extends StatelessWidget {
  const FoodPics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}
