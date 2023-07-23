// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String assetName;
  final String categoryName;
  const CategoryCard({
    Key? key,
    required this.assetName,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 70.h,
            width: 90.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(2, 3), // changes position of shadow
                ),
              ],
            ),
            child: Image.asset(
              assetName,
              fit: BoxFit.scaleDown,
            )),
        Container(
          height: 30.h,
          width: 80.w,
          alignment: Alignment.center,
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
