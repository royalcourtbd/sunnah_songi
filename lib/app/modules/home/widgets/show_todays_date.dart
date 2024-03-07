import 'package:flutter/material.dart';

class ShowTodaysDate extends StatelessWidget {
  const ShowTodaysDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('25 Shaaban, 1445',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text('বুধ, ১২ মে, ২০২৪'),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ],
      ),
    );
  }
}
