import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/modules/home/controller/home_controller.dart';
import 'package:sunnah_songi/app/modules/home/widgets/daily_salat_info.dart';
import 'package:sunnah_songi/app/modules/home/widgets/show_location_section.dart';
import 'package:sunnah_songi/app/modules/home/widgets/show_todays_date.dart';
import 'package:sunnah_songi/app/modules/home/widgets/start_page_announcement.dart';
import 'package:sunnah_songi/app/static/ui_const.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 45.percentHeight,
                    decoration: BoxDecoration(
                      gradient: bgLightGradient,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: SunnahScreen.height * 0.14),
                    StartPageAnnouncement(theme: Theme.of(context)),
                    gapH15,
                    const ShowLocationSection(),
                    gapH15,
                    const ShowTodaysDate(),
                    gapH15,
                    const DailySalatInfo()
                  ],
                ),
                AppBar(
                  title: const Text('Sunnah Songi'),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Fluttertoast.showToast(msg: "Updating Location");
                        Get.find<HomeController>().initFunctions();
                      },
                      icon: const Icon(Icons.refresh),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  final bgLightGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5, 1.0],
    colors: [
      // Color.fromARGB(255, 114, 245, 214),
      Color.fromARGB(255, 99, 206, 181),
      Color(0xff4abaa1),
      Color.fromARGB(255, 85, 147, 133),
    ],
  );
}

class OvalBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var controlPoint = Offset(size.width / 2, size.height); // Adjust the curve
    var endPoint =
        Offset(size.width, size.height - 30); // Adjust the height of the curve

    // Start with a line from the top left
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);

    // Create a quadratic bezier curve for the bottom
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    // Finish the path
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
