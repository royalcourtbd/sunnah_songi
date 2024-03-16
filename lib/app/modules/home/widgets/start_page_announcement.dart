import 'package:flutter/material.dart';
import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/external_libs/carousel_slider/carousel_slider.dart';
import 'package:sunnah_songi/app/static/number_utility.dart';

class StartPageAnnouncement extends StatelessWidget {
  const StartPageAnnouncement({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: const Key("announcement_repaint_boundary"),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: twentyPx,
        ),
        child: SizedBox(
          // color: Colors.yellow,
          width: SunnahScreen.width,
          height: 20.percentHeight,
          child: CarouselSlider.builder(
            itemBuilder: (__, index, _) {
              return InkWell(
                key: Key("hadith_slider_$index"),
                child: Container(
                  padding: EdgeInsets.only(top: eighteenPx),
                  //height: twentyPercentHeight,
                  width: SunnahScreen.width,
                  child: Text(
                    "Allah has sealed their hearts and their hearing, and their sight is covered. They will suffer a tremendous punishment.\n\n [Al Baqarah: 2:7]",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontFamily: "Roboto",
                      fontSize: fourteenPx,
                      fontWeight: FontWeight.w200,
                      height: 1.6,
                    ),
                  ),
                ),
              );
            },
            itemCount: 5,
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: 9.inSeconds,
              pauseAutoPlayOnTouch: false,
            ),
          ),
          // ),
        ),
      ),
    );
  }
}
