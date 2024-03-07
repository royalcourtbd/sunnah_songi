import 'package:flutter/material.dart';
import 'package:sunnah_songi/app/static/svg_path.dart';

class DayNightInfoRow extends StatelessWidget {
  const DayNightInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              SvgPath.icSun,
              width: 40,
              height: 40,
            ),
            const Text(
              '০৬:১৯ AM',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'সূর্যদয়',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 50,
            color: const Color(0xff049B78),
            width: 2,
          ),
        ),
        Column(
          children: [
            Image.asset(
              SvgPath.icSun,
              width: 40,
              height: 40,
            ),
            const Text(
              '০৭:১৯ PM',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'সূর্যাস্ত',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
