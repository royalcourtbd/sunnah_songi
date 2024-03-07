import 'package:flutter/material.dart';
import 'package:sunnah_songi/app/static/svg_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sunnah Songi'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffffeaea),
                      Color(0xffffc3c3),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      SvgPath.imgMinar,
                      width: 100,
                      height: 100,
                      color: const Color(0xffffc3c3),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
