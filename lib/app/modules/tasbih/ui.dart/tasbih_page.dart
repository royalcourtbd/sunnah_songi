import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sunnah_songi/app/common/config/quran_color.dart';
import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/external_libs/circular_seek_bar-master/circular_seek_bar.dart';

class TasbihPage extends StatelessWidget {
  const TasbihPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 40.percentWidth,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 20.percentWidth,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(tenPx),
                    ),
                  ),
                  child: const Text('1', style: TextStyle(fontSize: 20)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 20.percentWidth,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(tenPx),
                    ),
                  ),
                  child: const Text('33', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          const Text(
            'Tap on circle to count tasbih',
            style: TextStyle(fontSize: 20),
          ),
          const CircularSeekBar(
            width: double.infinity,
            height: 200,
            progress: 15,
            trackColor: SunnahColor.appBarColor,
            progressColor: SunnahColor.appbarColorLight,
            maxProgress: 33,
            minProgress: 0,
            child: Center(
              child: Text('1', style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(fiftyPx),
              border: Border.all(
                color: SunnahColor.appBarColor,
                width: 2,
              ),
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_outline,
              ),
              label: const Text(
                'Reset',
              ),
            ),
          )
        ],
      ),
    );
  }
}
