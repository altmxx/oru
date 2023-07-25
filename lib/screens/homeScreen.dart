import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/components/brandCard.dart';
import 'package:oru/components/categoryCard.dart';
import 'package:oru/components/phoneCard.dart';
import 'package:oru/components/productCarousel.dart';
import 'package:oru/components/slider.dart';
import 'package:oru/constants.dart';
import 'package:oru/providers/productsProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();
  var minTextFieldController = TextEditingController();
  var maxTextFieldController = TextEditingController();
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ProductsProvider>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<ProductsProvider>(context).mobiles;
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
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25.r),
                                            topRight: Radius.circular(25.r),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 38.sp,
                                              right: 38.sp,
                                              top: 31.sp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Filters",
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: black),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Clear Filters',
                                                        style: TextStyle(
                                                          color: red,
                                                          fontSize: 13.sp,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              SizedBox(height: 25.h),
                                              Text(
                                                "Brand",
                                                style:
                                                    TextStyle(fontSize: 15.sp),
                                              ),
                                              SizedBox(height: 12.h),
                                              SizedBox(
                                                height: 30.h,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'All',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Apple',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Samsung',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Google',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 30.h),
                                              Text(
                                                "Ram",
                                                style:
                                                    TextStyle(fontSize: 15.sp),
                                              ),
                                              SizedBox(height: 12.h),
                                              SizedBox(
                                                height: 30.h,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'All',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        '1 GB',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        '2 GB',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        '3 GB',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 30.h),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Conditions",
                                                    style: TextStyle(
                                                        fontSize: 15.sp),
                                                  ),
                                                  Icon(
                                                    Icons.info_outline,
                                                    size: 24.sp,
                                                    color: grey,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 12.h),
                                              SizedBox(
                                                height: 30.h,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'All',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Like New',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Excellent',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Good',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 30.h),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Warranty",
                                                    style: TextStyle(
                                                        fontSize: 15.sp),
                                                  ),
                                                  Icon(
                                                    Icons.info_outline,
                                                    size: 24.sp,
                                                    color: grey,
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 12.h),
                                              SizedBox(
                                                height: 30.h,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'All',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Brand Warranty',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Seller Warranty',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 30.h),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Verification",
                                                    style: TextStyle(
                                                        fontSize: 15.sp),
                                                  ),
                                                  Icon(Icons.info_outline,
                                                      size: 24.sp, color: grey),
                                                ],
                                              ),
                                              SizedBox(height: 12.h),
                                              SizedBox(
                                                height: 30.h,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: [
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'All',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25.h,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.sp),
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          BoxConstraints(
                                                              minWidth: 72.w),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r)),
                                                      child: Text(
                                                        'Verified',
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 30.h),
                                              Text(
                                                "Price",
                                                style:
                                                    TextStyle(fontSize: 15.sp),
                                              ),
                                              SizedBox(height: 8.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Min",
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                      SizedBox(width: 8.w),
                                                      SizedBox(
                                                        height: 25.h,
                                                        width: 80.w,
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.r))),
                                                            filled: true,
                                                            fillColor: white,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Max",
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                      ),
                                                      SizedBox(width: 8.w),
                                                      SizedBox(
                                                        height: 25.h,
                                                        width: 80.w,
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.r))),
                                                            filled: true,
                                                            fillColor: white,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const AdjustableRangeSlider(),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
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
                      return PhoneCard(product: loadedProducts[i]);
                    },
                    itemCount: loadedProducts.length,
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
