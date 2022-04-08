import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:oasis/helpers/responsiveness.dart';

class homebanner extends StatelessWidget {
  homebanner({
    Key? key,
  }) : super(key: key);

  @override
  final ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  HomePageController homePageController = Get.find();
  Widget build(BuildContext context) {
    return Container(
      padding: (ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isLargeScreen(context))
          ? EdgeInsets.only(top: 0.0)
          : EdgeInsets.only(top: 55.0),
      child: SizedBox(
        height: (ResponsiveWidget.isMediumScreen(context) ||
                ResponsiveWidget.isLargeScreen(context))
            ? 490
            : 220,
        child: GestureDetector(
          onTap: () {
            homePageController.isLoading.value = true;
            productDetailsController
                .fetchingProductDetails('Processor')
                .then((value) {
              homePageController.isLoading.value = false;
              Get.toNamed('/allproduct');
            });
          },
          child: Container(
            color: Colors.white,
            child: Stack(
              children: const [
                Carousel(
                  boxFit: BoxFit.cover,
                  // autoplay: true,
                  //animationCurve: Curves.decelerate,
                  animationDuration: Duration(milliseconds: 3000),
                  dotSize: 1.0,
                  dotIncreaseSize: 2.0,
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 6.0,
                  dotIncreasedColor: Colors.greenAccent,
                  images: [
                    NetworkImage(
                      "https://res.cloudinary.com/delta-santhai/image/upload/v1637568748/oasis/banner/Banner_1_qmhi5v.jpg",
                    ),
                    NetworkImage(
                        "https://res.cloudinary.com/delta-santhai/image/upload/v1637568748/oasis/banner/Banner_3_oqrfzq.jpg"),
                    NetworkImage(
                        "https://res.cloudinary.com/delta-santhai/image/upload/v1637568748/oasis/banner/Banner_2_pfxakh.jpg")
                  ],
                ),
                // Positioned(
                //     left: 20,
                //     top: 120,https://res.cloudinary.com/delta-santhai/image/upload/v1637568748/oasis/banner/Banner_2_pfxakh.jpg

                //     child: Text(
                //       "EVOLUTION-IT'S IN OUR HANDS",
                //       style: GoogleFonts.poppins(
                //           textStyle: TextStyle(
                //               fontSize: 36,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.red)),
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// GridView.count(
// crossAxisCount: 1,
// childAspectRatio: 2.5,
// crossAxisSpacing: 0.0,
// mainAxisSpacing: 0.0,
// shrinkWrap: true,
// children: [
//   CarouselSlider(
//       items: [
//         Image.network(
//             "https://images.unsplash.com/photo-1582203422342-1541a90a0103?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80"),
//         Image.network(
//             "https://images.unsplash.com/photo-1576400883215-7083980b6193?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1626&q=80"),
//         Image.network(
//             "https://images.unsplash.com/photo-1606414760045-9dd333105737?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"),
//       ],
//       options: CarouselOptions(
//         height: 600,
//         aspectRatio: 2 / 3,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 2),
//         autoPlayAnimationDuration: Duration(milliseconds: 500),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         scrollDirection: Axis.horizontal,
//       )),
// ]),
