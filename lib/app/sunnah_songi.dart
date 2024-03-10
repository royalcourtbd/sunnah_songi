import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/config/themes.dart';
import 'package:sunnah_songi/app/global_bindings.dart';
import 'package:sunnah_songi/app/modules/home/ui/home_page.dart';

class SunnahSongi extends StatelessWidget {
  const SunnahSongi({Key? key}) : super(key: key);

  static final GlobalKey _globalKey = GlobalKey();
  static BuildContext get globalContext =>
      Get.context ?? _globalKey.currentContext!;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sunnah Songi',
      darkTheme: SunnahTheme.darkTheme,
      theme: SunnahTheme.lightTheme,
      home: HomePage(),
      initialBinding: GlobalBindings(),
    );
  }
}
