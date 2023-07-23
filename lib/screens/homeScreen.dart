import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/components/brandCard.dart';
import 'package:oru/components/categoryCard.dart';
import 'package:oru/components/phoneCard.dart';
import 'package:oru/components/productCarousel.dart';
import 'package:oru/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              width: 428.w,
              height: 137.h,
              decoration: const BoxDecoration(color: darkBlue),
              child: Column(
                children: [
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
                  // SizedBox(height: 26.w),
                  SizedBox(
                    width: 402,
                    height: 45,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                          filled: true,
                          fillColor: white,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: black,
                          ),
                          hintText: "Search with make and model",
                          hintStyle: TextStyle(fontSize: 15.sp, color: grey)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    "Buy Top Brands",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: grey,
                    ),
                  ),
                  Container(
                    height: 90.h,
                    margin: EdgeInsets.symmetric(vertical: 5.sp),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        return BrandCard(imageUrl: imageUrl[i]);
                      },
                      separatorBuilder: (ctx, i) {
                        return SizedBox(width: 8.w);
                      },
                      itemCount: imageUrl.length,
                    ),
                  ),
                  ProductsCarousel(),
                  SizedBox(height: 15.h),
                  Text(
                    "Shop By",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: grey,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    height: 116.h,
                    margin: EdgeInsets.symmetric(vertical: 5.sp),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) {
                          return CategoryCard(
                            assetName: categoryAssets[i],
                            categoryName: categoryName[i],
                          );
                        },
                        separatorBuilder: (ctx, i) {
                          return SizedBox(width: 8.w);
                        },
                        itemCount: 4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Deals Near You",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Filters",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: grey,
                            ),
                          ),
                          IconButton(
                              splashRadius: 20,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.sort))
                        ],
                      )
                    ],
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 190 / 250),
                    itemBuilder: (ctx, i) {
                      return PhoneCard();
                    },
                    itemCount: 10,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
