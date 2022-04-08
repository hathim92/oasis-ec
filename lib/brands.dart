import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:oasis/helpers/responsiveness.dart';

class brands extends StatefulWidget {
  const brands({Key? key}) : super(key: key);

  @override
  _brandsState createState() => _brandsState();
}

class _brandsState extends State<brands> {
  HomePageController homePageController = Get.find();
  final ProductDetailsController _productDetailsController =
      Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Padding(
          padding: (ResponsiveWidget.isMediumScreen(context) ||
                  ResponsiveWidget.isLargeScreen(context))
              ? const EdgeInsets.only(left: 80, right: 100)
              : const EdgeInsets.only(left: 5, right: 5),
          child: Obx(() => Wrap(alignment: WrapAlignment.center, children: [
                for (var brand in homePageController.brands)
                  GestureDetector(
                    onTap: () {
                      homePageController.isLoading.value = true;
                      _productDetailsController
                          .fetchingProductDetailsByBrand(brand.name)
                          .then((value) {
                        homePageController.isLoading.value = false;
                        Get.toNamed('/allproduct');
                      });
                      print(brand.name);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.network(
                        brand.brandImages.first,
                        height: (ResponsiveWidget.isMediumScreen(context) ||
                                ResponsiveWidget.isLargeScreen(context))
                            ? 100.0
                            : 75.0,
                        width: (ResponsiveWidget.isMediumScreen(context) ||
                                ResponsiveWidget.isLargeScreen(context))
                            ? 100.0
                            : 75.0,
                      ),
                    ),
                  ),
                SizedBox(
                  width: 15.0,
                ),
                // Image.network(
                //   "https://res.cloudinary.com/delta-santhai/image/upload/v1637579765/oasis/banner/7_g7723f.png",
                // ),
                // SizedBox(
                //   width: 15.0,
                // ),
                // Image.network(
                //   "https://res.cloudinary.com/delta-santhai/image/upload/v1637579764/oasis/banner/3_fb9ng7.png",
                // ),
                // SizedBox(
                //   width: 15.0,
                // ),
                // Image.network(
                //   "https://res.cloudinary.com/delta-santhai/image/upload/v1637579764/oasis/banner/1_cxnpxv.png",
                // ),
                // SizedBox(
                //   width: 15.0,
                // ),
                // Image.network(
                //   "https://res.cloudinary.com/delta-santhai/image/upload/v1637579764/oasis/banner/6_xhvu3o.png",
                // ),
                // SizedBox(
                //   width: 15.0,
                // ),
                // Image.network(
                //     "https://res.cloudinary.com/delta-santhai/image/upload/v1637579764/oasis/banner/4_gf6zo6.png"),
                // SizedBox(
                //   width: 15.0,
                // ),
                // Image.network(
                //     "https://res.cloudinary.com/delta-santhai/image/upload/v1637579764/oasis/banner/5_nnkcsq.png"),
                // SizedBox(
                //   width: 15.0,
                //),
              ])),
        ));
  }
}
