import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/constants.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(2, 3), // changes position of shadow
        ),
      ]),
      padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 18.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 161.w,
          height: 107.h,
          color: grey,
        ),
        SizedBox(height: 12.h),
        Text(
          "₹5,500",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          "Apple iPhone 12",
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "128 GB",
              style: TextStyle(
                  fontSize: 10.sp, color: grey, fontWeight: FontWeight.bold),
            ),
            Text(
              "Condition: Excellent",
              style: TextStyle(
                  fontSize: 10.sp, color: grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Bhubhaneshvar",
              style: TextStyle(
                  fontSize: 10.sp, color: grey, fontWeight: FontWeight.bold),
            ),
            Text(
              "Dec 30th",
              style: TextStyle(
                  fontSize: 10.sp, color: grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }
}
