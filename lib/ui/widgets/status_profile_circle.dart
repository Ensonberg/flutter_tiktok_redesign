import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class StatusProfileCircle extends StatelessWidget {
  final String imagePath;
  final bool seen;
  final String name;
  const StatusProfileCircle(
      {Key? key,
      required this.imagePath,
      required this.seen,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 70.h,
              width: 80.w,
              decoration: BoxDecoration(
                  color: seen ? Theme.of(context).primaryColor : grey,
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.cover),
                      color: Colors.red.withOpacity(0.1),
                      shape: BoxShape.circle),
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          width: 12.w,
        ),
      ],
    );
  }
}
