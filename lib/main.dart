import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sunnah_songi/app/sunnah_songi.dart';
import 'package:sunnah_songi/firebase_options.dart';

void main() async {
  await initial();

  runApp(const SunnahSongi());
}

initial() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
