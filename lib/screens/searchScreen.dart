import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              width: 428.w,
              height: 137.h,
              color: darkBlue,
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: white,
                      ),
                    ),
                    SizedBox(width: 26.w),
                    Text(
                      "ORU PHONES",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: white),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "India",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: white),
                    ),
                    const Icon(
                      Icons.location_on,
                      color: white,
                    ),
                    SizedBox(width: 18.w),
                    const Icon(
                      Icons.notifications_outlined,
                      color: white,
                    ),
                  ],
                ),
                SizedBox(
                  width: 402,
                  height: 45,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      filled: true,
                      fillColor: white,
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 8.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Brand",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: grey,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      "Mobile Model",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: grey,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "One Plus",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
