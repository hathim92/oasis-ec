import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/constants/style.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/single_product_controller.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/models/featuredetail_Model.dart';
import 'package:oasis/models/feature_Model.dart';
import 'package:oasis/pages/detailpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oasis/pages/responsive_card.dart';
import 'package:oasis/pages/textform.dart';
import 'package:url_launcher/url_launcher.dart';

class fproduct extends StatefulWidget {
  const fproduct({Key? key}) : super(key: key);
  @override
  _fproductState createState() => _fproductState();
}

class _fproductState extends State<fproduct> {
  SingleProductController singleProductController = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height) / 2.2;
    final double cardwidth = size.width / 2;
    double _height = 700.0;
    HomePageController homePageController = Get.find();
    return Material(
        color: Colors.white,
        child: Padding(
          padding: (ResponsiveWidget.isMediumScreen(context) ||
                  ResponsiveWidget.isLargeScreen(context))
              ? const EdgeInsets.only(left: 80, right: 80)
              : const EdgeInsets.all(1.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: ishover ? size.height / 2 : itemHeight,
                  child: ScrollConfiguration(
                    behavior:
                        ScrollConfiguration.of(context).copyWith(dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                    }),
                    child: Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homePageController.featuredProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    homePageController.isLoading.value = true;
                                    singleProductController
                                        .fetchDetails(homePageController
                                            .featuredProducts[index].id)
                                        .then((value) {
                                      singleProductController.details.refresh();

                                      singleProductController
                                          .indexValueOfImage.value = 0;
                                      homePageController.isLoading.value =
                                          false;
                                      Get.to(
                                        detail(),
                                      );
                                    });
                                  });
                                },
                                child: AnimatedContainer(
                                  constraints: BoxConstraints(maxHeight: 450.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0.1),
                                            color: ishover
                                                ? Colors.grey
                                                : Colors.white,
                                            spreadRadius: 0,
                                            blurRadius: 1)
                                      ]),
                                  duration: Duration(milliseconds: 200),
                                  height:
                                      ishover ? itemHeight : size.height / 2,
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5, top: 0, bottom: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.network(
                                        homePageController
                                            .featuredProducts[index]
                                            .featuredProductImages[0],
                                        fit: BoxFit.fill,
                                        height: ishover
                                            ? size.height / 3.5
                                            : size.height / 4,
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth: itemWidth / 3),
                                        child: Text(
                                          homePageController
                                              .featuredProducts[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 1.2,
                                              fontSize: desktopheading2 / 1.5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        homePageController
                                            .featuredProducts[index]
                                            .categoryName
                                            .first,
                                        style: TextStyle(
                                            fontSize: desktopsubtext
                                            // /
                                            //     1.5
                                            ,
                                            color: Colors.grey),
                                      ),
                                      // FittedBox(
                                      //   child: Row(
                                      //     children: [
                                      //       homePageController
                                      //                   .featuredProducts[index]
                                      //                   .type ==
                                      //               'simple'
                                      //           ? Text(
                                      //               homePageController
                                      //                   .featuredProducts[index]
                                      //                   .salePrice
                                      //                   .toString(),
                                      //               style: TextStyle(
                                      //                 fontSize: desktopsubtext
                                      //                 // /
                                      //                 //     1.5
                                      //                 ,
                                      //                 fontWeight:
                                      //                     FontWeight.bold,
                                      //                 color: Colors.blue,
                                      //               ),
                                      //             )
                                      //           : Text(
                                      //               homePageController
                                      //                   .featuredProducts[index]
                                      //                   .variations[0]
                                      //                   .salePrice
                                      //                   .toString(),
                                      //               style: TextStyle(
                                      //                 fontSize: desktopsubtext,
                                      //                 fontWeight:
                                      //                     FontWeight.bold
                                      //                 // /
                                      //                 //     1.5
                                      //                 ,
                                      //                 color: Colors.blue,
                                      //               ),
                                      //             ),
                                      //       SizedBox(width: 8),
                                      //       homePageController
                                      //                   .featuredProducts[index]
                                      //                   .type ==
                                      //               'simple'
                                      //           ? Text(
                                      //               homePageController
                                      //                   .featuredProducts[index]
                                      //                   .regularPrice
                                      //                   .toString(),
                                      //               style: TextStyle(
                                      //                 decoration: TextDecoration
                                      //                     .lineThrough,
                                      //                 fontSize: desktopsubtext
                                      //                 // /
                                      //                 //     2
                                      //                 ,
                                      //                 color: Colors.black,
                                      //               ),
                                      //             )
                                      //           : Text(
                                      //               homePageController
                                      //                   .featuredProducts[index]
                                      //                   .variations[0]
                                      //                   .regularPrice
                                      //                   .toString(),
                                      //               style: TextStyle(
                                      //                 decoration: TextDecoration
                                      //                     .lineThrough,
                                      //                 fontSize: desktopsubtext
                                      //                 // /
                                      //                 //     2
                                      //                 ,
                                      //                 color: Colors.black,
                                      //               ),
                                      //             ),
                                      //     ],
                                      //   ),
                                      // ),

                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            // height: 32,
                                            // width: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.green),
                                            child: Center(
                                              child: Text(
                                                "Learn More",
                                                style: TextStyle(
                                                    fontSize: desktoplinktext,
                                                    // /
                                                    //     1.5,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              print("entered");
                                              launch(
                                                  "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${homePageController.featuredProducts[index].name}");
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5.0),
                                              // height: 32,
                                              // width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.green),
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "images/whatsapp.png",
                                                      width: 12.0,
                                                      height: 12.0,
                                                    ),
                                                    SizedBox(
                                                      width: 3.0,
                                                    ),
                                                    Text(
                                                      "Order Now",
                                                      style: TextStyle(
                                                          fontSize: mobilebody,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
