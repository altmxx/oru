import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/constants.dart';

class ProductsCarousel extends StatefulWidget {
  const ProductsCarousel({super.key});

  @override
  State<ProductsCarousel> createState() => _ProductsCarouselState();
}

class _ProductsCarouselState extends State<ProductsCarousel> {
  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> images = [
    'https://www.gizmochina.com/wp-content/uploads/2018/10/GeekBuying-Italy-Stock-Offer-Zone.jpg',
    'https://www.91-cdn.com/hub/wp-content/uploads/2023/05/amazon-great-summer-sale-ends-midnight-best-deals.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH7qlncCH98CzQkv5NLovlmxBy8lBV53Halg',
    'https://assets.mspimages.in/gear/wp-content/uploads/2022/07/Amazon-Prime-Day-2022-Sale-1.jpg',
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 428.w,
          height: 241.h,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index % images.length;
              });
            },
            itemBuilder: (context, index) {
              return SizedBox(
                child: CachedNetworkImage(
                  imageUrl: images[index % images.length],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < images.length; i++)
              buildIndicator(currentIndex == i)
          ],
        ),
      ],
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: isSelected
          ? Container(
              height: 8,
              width: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: darkBlue),
            )
          : Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
    );
  }
}
