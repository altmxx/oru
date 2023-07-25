// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/constants.dart';
import 'package:oru/models/models.dart';

class PhoneCard extends StatelessWidget {
  final Product product;
  const PhoneCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  // String convertToYYYYMMDD(String date) {
  //   List<String> dateParts = date.split('/');
  //   String day = dateParts[0].padLeft(2, '0');
  //   String month = dateParts[1].padLeft(2, '0');
  //   String year = dateParts[2];
  //   return year + month + day;
  // }

  @override
  Widget build(BuildContext context) {
    // NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    // product.listingDate = convertToYYYYMMDD(product.listingDate);
    // DateTime listingDate = DateTime.parse(product.listingDate);
    // String formattedDate = DateFormat.MMMMd().format(listingDate);

    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(2, 3), // changes position of shadow
          ),
        ],
        // image: DecorationImage(
        //     image: CachedNetworkImageProvider(product.imageUrl),
        //     fit: BoxFit.cover),
      ),
      padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 18.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 161.w,
          height: 107.h,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: CachedNetworkImageProvider(product.imageUrl),
            fit: BoxFit.contain,
          )),
        ),
        SizedBox(height: 12.h),
        Text(
          "₹${product.price}",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          product.model,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.storage,
              style: TextStyle(
                  fontSize: 10.sp, color: grey, fontWeight: FontWeight.bold),
            ),
            Text(
              "Condition: ${product.deviceCondition}",
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
              product.location,
              style: TextStyle(
                  fontSize: 10.sp, color: grey, fontWeight: FontWeight.bold),
            ),
            Text(
              "${product.listingDate}",
              style: TextStyle(
                  fontSize: 10.sp, color: grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }
}
