import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oasis/Services/api_service.dart';
import 'package:oasis/commonappbar.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:oasis/controllers/single_product_controller.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/img-container.dart';
import 'package:oasis/models/home_page_model.dart' as hm;
import 'package:oasis/pages/categorypage.dart';
import 'package:oasis/pages/new_arrivals.dart';
import 'package:oasis/pages/productgrid.dart';
import 'package:oasis/smallbanner.dart';
import 'package:oasis/top_bar.dart';
import 'package:http/http.dart' as http;

import 'package:oasis/top_scroll.dart';
import 'package:oasis/controllers/productDetails_controller.dart';

import 'trending_product.dart';
import 'bannercontainer.dart';
import 'brands.dart';
import 'explore.dart';
import 'featureproduct.dart';
import 'footer.dart';
import 'homebanner.dart';
import 'middlebanner.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

//Color _color = Colors.white;
bool isChange = false;

class _homepageState extends State<homepage> {
  HomePageController homePageController = Get.put(HomePageController());
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  SingleProductController singleProductController =
      Get.put(SingleProductController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: commonappbar(),
        // drawer: Drawer(),
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            SingleChildScrollView(
                child: Obx(
              () => homePageController.isLoading.value == true
                  ? Center(
                      child: Container(
                        width: 450.0,
                        height: 450.0,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        (ResponsiveWidget.isMediumScreen(context) ||
                                ResponsiveWidget.isLargeScreen(context))
                            ? topscroll()
                            : Text(""),

                        // SizedBox(
                        //   height: 5.0,
                        // ),
                        homebanner(),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isLargeScreen(context))
                              ? EdgeInsets.only(top: 30)
                              : EdgeInsets.only(top: 1.0),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 5, // Space between underline and text
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.green,
                                width: 2.0, // Underline thickness
                              ))),
                              child: Text("Featured Categories",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontFamily: bigfamily,
                                      fontSize: (ResponsiveWidget
                                                  .isMediumScreen(context) ||
                                              ResponsiveWidget.isLargeScreen(
                                                  context))
                                          ? 24
                                          : 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        CategoryPage(),
                        SizedBox(
                          height: 20.0,
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
                        //   child: Container(
                        //     child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         primary: Colors.indigo[600],
                        //         elevation: 0.0,
                        //         shape: new RoundedRectangleBorder(
                        //           borderRadius: new BorderRadius.circular(25.0),
                        //         ),
                        //         padding: EdgeInsets.all(18.0),
                        //       ),
                        //       onPressed: () {},
                        //       child: Padding(
                        //         padding: EdgeInsets.only(
                        //             left: 30.0, top: 0.0, right: 30.0, bottom: 0.0),
                        //         child: Text(
                        //           'Load More',
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: smallbanner(),
                        ),
                        Padding(
                          padding: (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isLargeScreen(context))
                              ? EdgeInsets.only(top: 30)
                              : EdgeInsets.only(top: 1.0),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 5, // Space between underline and text
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.green,
                                width: 2.0, // Underline thickness
                              ))),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text("New Arrivals",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontFamily: bigfamily,
                                        fontSize: (ResponsiveWidget
                                                    .isMediumScreen(context) ||
                                                ResponsiveWidget.isLargeScreen(
                                                    context))
                                            ? 24
                                            : 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: NewArrivals(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
                          child: Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.indigo[600],
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                padding: EdgeInsets.all(18.0),
                              ),
                              onPressed: () {
                                homePageController.isLoading.value = true;
                                productDetailsController
                                    .fetchingProductDetails('Processor')
                                    .then((value) {
                                  homePageController.isLoading.value = false;
                                  Get.toNamed('/allproduct');
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 30.0,
                                    top: 0.0,
                                    right: 30.0,
                                    bottom: 0.0),
                                child: Text(
                                  'View All',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isLargeScreen(context))
                              ? Container(
                                  margin: EdgeInsets.only(left: 80, right: 80),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    5, // Space between underline and text
                                              ),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.green,
                                                width:
                                                    2.0, // Underline thickness
                                              ))),
                                              child: Text(
                                                "Featured Products",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontFamily: bigfamily,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15.0, 8.0, 8.0, 8.0),
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                style: BorderStyle.solid,
                                                color: Colors.green,
                                                width:
                                                    2.0, // Underline thickness
                                              ))),
                                              child: Text(
                                                "Feature Products",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontFamily: bigfamily,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                        ),
                        Padding(
                          padding: (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isLargeScreen(context))
                              ? const EdgeInsets.only(top: 30)
                              : const EdgeInsets.only(top: 8.0),
                          child: fproduct(),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
                          child: Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.indigo[600],
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                padding: EdgeInsets.all(18.0),
                              ),
                              onPressed: () {
                                homePageController.isLoading.value = true;
                                productDetailsController
                                    .fetchingProductDetails('Processor')
                                    .then((value) {
                                  homePageController.isLoading.value = false;
                                  Get.toNamed('/allproduct');
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 30.0,
                                    top: 0.0,
                                    right: 30.0,
                                    bottom: 0.0),
                                child: Text(
                                  'View All',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 30),
                        //   child: Center(
                        //     child: Container(
                        //       padding: EdgeInsets.only(
                        //         bottom: 5, // Space between underline and text
                        //       ),
                        //       decoration: BoxDecoration(
                        //           border: Border(
                        //               bottom: BorderSide(
                        //         style: BorderStyle.solid,
                        //         color: Colors.green,
                        //         width: 2.0, // Underline thickness
                        //       ))),
                        //       child: Text("Brands",
                        //           style: GoogleFonts.poppins(
                        //             textStyle: TextStyle(
                        //               fontFamily: bigfamily,
                        //               fontSize: 24,
                        //               fontWeight: FontWeight.w600,
                        //             ),
                        //           )),
                        //     ),
                        //   ),
                        // ),
                        // brands(),

                        !(ResponsiveWidget.isMediumScreen(context) ||
                                ResponsiveWidget.isLargeScreen(context))
                            ? Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Container() //middle_banner(),
                                )
                            : Padding(padding: EdgeInsets.all(1.0)),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isLargeScreen(context))
                              ? Container(
                                  margin: EdgeInsets.only(left: 80, right: 80),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Center(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  bottom:
                                                      5, // Space between underline and text
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: Colors.green,
                                                  width:
                                                      2.0, // Underline thickness
                                                ))),
                                                child: Text(
                                                  "Trending Products",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontFamily: bigfamily,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                )
                              : Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15.0, 8.0, 8.0, 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                              style: BorderStyle.solid,
                                              color: Colors.green,
                                              width: 2.0, // Underline thickness
                                            ))),
                                            child: Text(
                                              "Trending Products",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontFamily: bigfamily,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: tproduct(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
                          child: Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.indigo[600],
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                padding: EdgeInsets.all(18.0),
                              ),
                              onPressed: () {
                                homePageController.isLoading.value = true;
                                productDetailsController
                                    .fetchingProductDetails('Processor')
                                    .then((value) {
                                  homePageController.isLoading.value = false;
                                  Get.toNamed('/allproduct');
                                  //Get.to(allproduct());
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 30.0,
                                    top: 0.0,
                                    right: 30.0,
                                    bottom: 0.0),
                                child: Text(
                                  'View All',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: //EdgeInsets.only(top: 30),
                              (ResponsiveWidget.isMediumScreen(context) ||
                                      ResponsiveWidget.isLargeScreen(context))
                                  ? EdgeInsets.only(top: 30)
                                  : EdgeInsets.all(0),
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
                              //height: 450,
                              child: Image.network(
                                "https://res.cloudinary.com/delta-santhai/image/upload/v1637582985/oasis/banner/Gaming_Banner_m3iv5d.jpg",
                                width: MediaQuery.of(context).size.width,
                                //fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isLargeScreen(context))
                              ? EdgeInsets.only(top: 30)
                              : EdgeInsets.only(top: 15.0),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 5, // Space between underline and text
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.green,
                                width: 2.0, // Underline thickness
                              ))),
                              child: Text("Top Selling Products",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontFamily: bigfamily,
                                      fontSize: (ResponsiveWidget
                                                  .isMediumScreen(context) ||
                                              ResponsiveWidget.isLargeScreen(
                                                  context))
                                          ? 24
                                          : 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: imgcontain(), //NewArrivals(), //imgcontain(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 5, // Space between underline and text
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.green,
                                width: 2.0, // Underline thickness
                              ))),
                              child: Text("Brands",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontFamily: bigfamily,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        brands(),
                        Padding(
                          padding: (ResponsiveWidget.isMediumScreen(context) ||
                                  ResponsiveWidget.isLargeScreen(context))
                              ? EdgeInsets.only(top: 30)
                              : EdgeInsets.only(top: 10),
                          child: footer(),
                        )
                      ],
                    ),
            )),
            Container(
              height: 80.0,
              child: Material(
                elevation: 0.0,
                child: topbar(),
              ),
            ),
          ],
        ));
  }
}
