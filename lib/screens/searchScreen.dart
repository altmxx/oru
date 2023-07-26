import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/constants.dart';
import 'package:oru/providers/searchProvider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                  Container(
                    width: 402,
                    height: 45,
                    alignment: Alignment.center,
                    child: TextField(
                      autofocus: true,
                      controller: searchController,
                      onEditingComplete: () {
                        Provider.of<SearchProvider>(context, listen: false)
                            .getSearchResults(searchController.text);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
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
                      Consumer<SearchProvider>(
                          builder: (context, searchProvider, _) {
                        return searchProvider.isLoading
                            ? const Center(
                                child:
                                    CircularProgressIndicator(color: darkBlue),
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, i) {
                                  return Provider.of<SearchProvider>(context)
                                          .brand
                                          .isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          Provider.of<SearchProvider>(context)
                                              .brand[i],
                                          style: TextStyle(fontSize: 15.sp));
                                },
                                separatorBuilder: (ctx, i) {
                                  return SizedBox(height: 24.h);
                                },
                                itemCount: Provider.of<SearchProvider>(context)
                                    .brand
                                    .length);
                      }),
                      SizedBox(height: 32.h),
                      Text(
                        "Mobile Model",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: grey,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Consumer<SearchProvider>(
                          builder: (context, searchProvider, _) {
                        return searchProvider.isLoading
                            ? const Center(
                                child:
                                    CircularProgressIndicator(color: darkBlue))
                            : ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (ctx, i) {
                                  return Provider.of<SearchProvider>(context)
                                          .models
                                          .isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          Provider.of<SearchProvider>(context)
                                              .models[i],
                                          style: TextStyle(fontSize: 15.sp));
                                },
                                separatorBuilder: (ctx, i) {
                                  return SizedBox(height: 24.h);
                                },
                                itemCount: Provider.of<SearchProvider>(context)
                                    .models
                                    .length);
                      })
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
