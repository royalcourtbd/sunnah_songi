import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/home_page.dart';

class SunnahSongi extends StatelessWidget {
  const SunnahSongi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sunnah Songi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
