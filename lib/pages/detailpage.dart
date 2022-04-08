import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oasis/constants/style.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/pages/responsive_card.dart';
import 'package:oasis/trending_product.dart';
import 'package:oasis/commonappbar.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:oasis/controllers/single_product_controller.dart';
import 'package:oasis/featureproduct.dart';
import 'package:oasis/footer.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/homepage.dart';
import 'package:oasis/models/featuredetail_Model.dart';
import 'package:oasis/models/similar_Model.dart';
import 'package:oasis/pages/productgrid.dart';
import 'package:oasis/pages/textform.dart';
import 'package:oasis/top_bar.dart';
import 'package:oasis/top_scroll.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class detail extends StatefulWidget {
  // detailModel details;
  // detail({Key? key, required this.details}) : super(key: key);

  @override
  _detailState createState() => _detailState();
}

//late final detailModel details;
// String a = value;

class _detailState extends State<detail> {
  SingleProductController singleProductController = Get.find();
  ProductDetailsController productDetailsController = Get.find();
  HomePageController homePageController = Get.find();
  bool _showBackToTopButton = false;
  int startingpage = 0;
  final _mycontroller = CarouselController();
  List imgList = [
    "https://res.cloudinary.com/oasis-it-store/image/upload/v1642171965/Media-Upload/asgsqmx18ujcc8jhuoek.png",
  ];

  //late ScrollController _scrollController;

  @override
  void onInit() {
    // setState(() {
    //   if (_scrollController.offset >= 400) {
    //     _showBackToTopButton = true; // show the back-to-top button
    //   } else {
    //     _showBackToTopButton = false; // hide the back-to-top button
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final _sController = ScrollController();
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height) / 2.2;
    final double cardwidth = size.width / 2;
    double _height = 700.0;
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: commonappbar(),
        // drawer: Drawer(),
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _sController,
                child:
                    (ResponsiveWidget.isMediumScreen(context) ||
                            ResponsiveWidget.isLargeScreen(context))
                        ? Column(
                            children: [
                              topscroll(),
                              Container(
                                height: 500,
                                margin: EdgeInsets.only(
                                  left: 30,
                                  right: 80,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Obx(() => Container(
                                            child: ScrollConfiguration(
                                              behavior: ScrollConfiguration.of(
                                                      context)
                                                  .copyWith(scrollbars: false),
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 50.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            for (var imageItem
                                                                in singleProductController
                                                                        .details[
                                                                    'images'])
                                                              MouseRegion(
                                                                onEnter:
                                                                    (event) {
                                                                  setState(() {
                                                                    singleProductController
                                                                        .indexValueOfImage
                                                                        .value = singleProductController.details[
                                                                            'images']
                                                                        .indexOf(
                                                                            imageItem);
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                                  decoration: BoxDecoration(
                                                                      // border: Border.all(
                                                                      //     color: Colors.grey),
                                                                      color: Colors.white,
                                                                      borderRadius: BorderRadius.circular(10)),
                                                                  height: 80,
                                                                  width: 80,
                                                                  child: Center(
                                                                      child: Image
                                                                          .network(
                                                                    imageItem[
                                                                            'image']
                                                                        ['url'],
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                                ),
                                                              ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            // Container(
                                                            //   decoration: BoxDecoration(
                                                            //       border:
                                                            //           Border.all(color: Colors.grey),
                                                            //       color: Colors.white,
                                                            //       borderRadius:
                                                            //           BorderRadius.circular(10)),
                                                            //   height: 100,
                                                            //   width: 100,
                                                            //   child: Center(
                                                            //     child:
                                                            //         Image.asset('images/keyboard.jpg'),
                                                            //   ),
                                                            // ),
                                                            // SizedBox(
                                                            //   height: 15,
                                                            // ),
                                                            // Container(
                                                            //   decoration: BoxDecoration(
                                                            //       border:
                                                            //           Border.all(color: Colors.grey),
                                                            //       color: Colors.white,
                                                            //       borderRadius:
                                                            //           BorderRadius.circular(10)),
                                                            //   height: 100,
                                                            //   width: 100,
                                                            //   child: Center(
                                                            //     child:
                                                            //         Image.asset('images/keyboard.jpg'),
                                                            //   ),
                                                            // ),
                                                            // SizedBox(
                                                            //   height: 15,
                                                            // ),
                                                            // Container(
                                                            //   decoration: BoxDecoration(
                                                            //       border:
                                                            //           Border.all(color: Colors.grey),
                                                            //       color: Colors.white,
                                                            //       borderRadius:
                                                            //           BorderRadius.circular(10)),
                                                            //   height: 100,
                                                            //   width: 100,
                                                            //   child: Center(
                                                            //     child:
                                                            //         Image.asset('images/keyboard.jpg'),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Container(
                                                          height: 500,
                                                          width: 500,
                                                          decoration: BoxDecoration(
                                                              // border: Border.all(color: Color(0xffe2e2e2)),
                                                              // boxShadow: [
                                                              //   BoxShadow(
                                                              //       color: Colors.grey,
                                                              //       spreadRadius: 0,
                                                              //       blurRadius: 1,
                                                              //       offset: Offset(0, 0.5))
                                                              // ],
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(30)),
                                                          child: Center(
                                                            child:
                                                                Image.network(
                                                              singleProductController
                                                                          .details[
                                                                      'images'][
                                                                  singleProductController
                                                                      .indexValueOfImage
                                                                      .value]['image']['url'],
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: SingleChildScrollView(
                                          child: Container(
                                            // height:
                                            //     2000, //MediaQuery.of(context).size.height,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            // Obx(
                                                            //   () =>
                                                            Text(
                                                              "",
                                                              // singleProductController
                                                              //                 .details[
                                                              //             'category'][0]
                                                              //         ['name'] +
                                                              //     '/' +
                                                              //     singleProductController
                                                              //                 .details[
                                                              //             'category'][1]
                                                              //         ['name'],
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .grey)),
                                                            ),
                                                            // ),
                                                            // Text(
                                                            //   "Video Game/",
                                                            //   style: GoogleFonts.poppins(
                                                            //       textStyle: TextStyle(
                                                            //           fontSize: 14,
                                                            //           color: Colors.grey)),
                                                            // ),
                                                            // Text(
                                                            //   "Microsoft X-Box One S",
                                                            //   style: GoogleFonts.poppins(
                                                            //       textStyle: TextStyle(
                                                            //           fontSize: 14,
                                                            //           color: Colors.black)),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                      // GestureDetector(
                                                      //   onTap: () {},
                                                      //   child: Icon(
                                                      //     Icons.chevron_left,
                                                      //     size: 20,
                                                      //     color: Colors.grey,
                                                      //   ),
                                                      // ),
                                                      // GestureDetector(
                                                      //   onTap: () {},
                                                      //   child: Icon(
                                                      //     Icons.apps,
                                                      //     size: 20,
                                                      //     color: Colors.grey,
                                                      //   ),
                                                      // ),
                                                      // GestureDetector(
                                                      //   onTap: () {},
                                                      //   child: Icon(
                                                      //     Icons.chevron_right,
                                                      //     size: 20,
                                                      //     color: Colors.grey,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Obx(
                                                  () => Text(
                                                    //"testing",
                                                    singleProductController
                                                        .details['name'],
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Obx(
                                                  () => Text(
                                                    singleProductController
                                                            .details[
                                                        'shortDescription'],
                                                    maxLines: 3,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.start,
                                                //   children: [
                                                //     // SvgPicture.asset(
                                                //     //   "icons/rupees.svg",
                                                //     //   height: 16,
                                                //     //   color: Color(0xff007BC4),
                                                //     // ),
                                                //     Obx(
                                                //       () => Text(
                                                //         // '30,000',
                                                //         singleProductController
                                                //                         .details[
                                                //                     'type'] ==
                                                //                 'simple'
                                                //             ? '₹ ' +
                                                //                 singleProductController
                                                //                     .details[
                                                //                         'salePrice']
                                                //                     .toString()
                                                //             : singleProductController
                                                //                 .details[
                                                //                     'variations']
                                                //                     [0][
                                                //                     'salePrice']
                                                //                 .toString(),
                                                //         style: GoogleFonts.poppins(
                                                //             textStyle: TextStyle(
                                                //                 fontSize: 18,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .w600,
                                                //                 color: Color(
                                                //                     0xff007BC4))),
                                                //       ),
                                                //     ),
                                                //     const SizedBox(width: 10.0),
                                                //     Obx(
                                                //       () => Text(
                                                //         singleProductController
                                                //                         .details[
                                                //                     'type'] ==
                                                //                 'simple'
                                                //             ? '₹ ' +
                                                //                 singleProductController
                                                //                     .details[
                                                //                         'regularPrice']
                                                //                     .toString()
                                                //             : '₹ ' +
                                                //                 singleProductController
                                                //                     .details[
                                                //                         'variations']
                                                //                         [0][
                                                //                         'regularPrice']
                                                //                     .toString(),
                                                //         style: GoogleFonts.poppins(
                                                //             textStyle: TextStyle(
                                                //                 decoration:
                                                //                     TextDecoration
                                                //                         .lineThrough,
                                                //                 fontSize: 14,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .w600,
                                                //                 color: Color(
                                                //                     0xff007BC4))),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                                // SizedBox(
                                                //   height: 20,
                                                // ),
                                                GestureDetector(
                                                  onTap: () {
                                                    print("entered");
                                                    launch(
                                                        "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${singleProductController.details['name']}");
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 6.0, right: 3.0),
                                                    height: 40,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "images/whatsapp.png",
                                                            width: 14.0,
                                                            height: 14.0,
                                                          ),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Text(
                                                            "Order Now",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "Specifications",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Obx(() => Column(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Table(
                                                              border: const TableBorder(
                                                                  horizontalInside: BorderSide(
                                                                      width: 0.3,
                                                                      color: Colors.grey, //Color(0xffe2e2e2),
                                                                      style: BorderStyle.none)),
                                                              defaultVerticalAlignment:
                                                                  TableCellVerticalAlignment
                                                                      .middle,
                                                              columnWidths: {
                                                                0: FractionColumnWidth(
                                                                    .5)
                                                              },
                                                              children: [
                                                                for (var specifications
                                                                    in singleProductController
                                                                            .details[
                                                                        'specifications'])
                                                                  for (var specValues
                                                                      in specifications[
                                                                              'specGroup']
                                                                          [
                                                                          'specNamesAndValues'])
                                                                    TableRow(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(
                                                                              10.0,
                                                                            ),
                                                                            child:
                                                                                Text(specValues['name'], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey))),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(10.0),
                                                                            child:
                                                                                Text(specValues['value'], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black))),
                                                                          ),
                                                                        ]),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Container(
                                                      //height: 80,
                                                      // decoration: BoxDecoration(
                                                      //     border: Border(
                                                      //         top: BorderSide(
                                                      //   style: BorderStyle.solid,
                                                      //   color: Color(0xffe2e2e2),
                                                      // ))),
                                                      child:
                                                          // Obx(
                                                          //   () =>
                                                          Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              for (var variations
                                                                  in singleProductController
                                                                      .details[
                                                                          'variations']
                                                                      .toSet()
                                                                      .toList())
                                                                // Text(
                                                                //   variations['attributes'][0]
                                                                //       ['label'],
                                                                //   style: GoogleFonts.poppins(
                                                                //       textStyle: TextStyle(
                                                                //     color: Colors.black,
                                                                //     fontSize: 12,
                                                                //   )),
                                                                // ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          12.0,
                                                                      right:
                                                                          12.0),
                                                                  child: Text(
                                                                    variations['attributes']
                                                                            [0][
                                                                        'value'],
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                            textStyle:
                                                                                TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12,
                                                                    )),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      // ),
                                                    ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              // Container(
                              //   //margin: defaultmargin,
                              //   height: 200,
                              //   child: Column(
                              //     children: [
                              //       Row(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         children: [
                              //           Padding(
                              //             padding: const EdgeInsets.only(
                              //               top: 15.0,
                              //             ),
                              //             child: Text("DESCRIPTION",
                              //                 style: GoogleFonts.poppins(
                              //                     textStyle: TextStyle(
                              //                         fontSize: 16,
                              //                         fontWeight: FontWeight.w600,
                              //                         color: Colors.black))),
                              //           ),
                              //         ],
                              //       ),
                              //       Padding(
                              //         padding: EdgeInsets.all(20),
                              //         child: Obx(
                              //           () => Text(
                              //             singleProductController
                              //                 .details['longDescription'],
                              //             // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              //             textAlign: TextAlign.left,
                              //             maxLines: 5,
                              //             overflow: TextOverflow.ellipsis,
                              //             style: GoogleFonts.poppins(
                              //                 textStyle: TextStyle(
                              //                     fontSize: 14, color: Colors.grey)),
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),

                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Container(
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  print("entered");
                                                  final double start = 0.0;
                                                  WidgetsBinding.instance!
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    print("entered1");
                                                  });

                                                  // setState(() {
                                                  //   if (_scrollController.hasClients) {
                                                  //     Future.delayed(
                                                  //         Duration(milliseconds: 50), () {
                                                  //       _scrollController.jumpTo(start);
                                                  //     });
                                                  //   } else {
                                                  //     print('No clints!!!!');
                                                  //   }
                                                  // });
                                                },
                                                child: Text(
                                                  "Feature Products",
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
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          productDetailsController
                                              .fetchingProductDetails(
                                                  'Processor')
                                              .then((value) {
                                            Get.toNamed('/allproduct');
                                          });
                                        },
                                        child: Text(
                                          "view all",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: smallfamily,
                                            fontSize: 14,
                                            color: Color(0xff333D61),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: ishover
                                            ? size.height / 2
                                            : itemHeight,
                                        child: ScrollConfiguration(
                                          behavior:
                                              ScrollConfiguration.of(context)
                                                  .copyWith(dragDevices: {
                                            PointerDeviceKind.mouse,
                                            PointerDeviceKind.touch,
                                          }),
                                          child: Obx(
                                            () => ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: homePageController
                                                  .featuredProducts.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          print(
                                                              "setState value is ${startingpage}");
                                                          _sController.animateTo(
                                                              0,
                                                              duration:
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                              curve: Curves
                                                                  .linear);

                                                          homePageController
                                                              .isLoading
                                                              .value = true;
                                                          singleProductController
                                                              .fetchDetails(
                                                                  homePageController
                                                                      .featuredProducts[
                                                                          index]
                                                                      .id)
                                                              .then((value) {
                                                            singleProductController
                                                                .details
                                                                .refresh();

                                                            singleProductController
                                                                .indexValueOfImage
                                                                .value = 0;
                                                            homePageController
                                                                .isLoading
                                                                .value = false;
                                                            startingpage = 0;
                                                            Get.to(
                                                              detail(),
                                                            );
                                                          });
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        constraints:
                                                            BoxConstraints(
                                                                maxHeight:
                                                                    450.0),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  offset: Offset(
                                                                      0, 0.1),
                                                                  color: ishover
                                                                      ? Colors
                                                                          .grey
                                                                      : Colors
                                                                          .white,
                                                                  spreadRadius:
                                                                      0,
                                                                  blurRadius: 1)
                                                            ]),
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                        height: ishover
                                                            ? itemHeight
                                                            : size.height / 2,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5,
                                                                right: 5,
                                                                top: 0,
                                                                bottom: 5),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Image.network(
                                                              homePageController
                                                                  .featuredProducts[
                                                                      index]
                                                                  .featuredProductImages[0],
                                                              fit: BoxFit.fill,
                                                              height: ishover
                                                                  ? size.height /
                                                                      3.5
                                                                  : size.height /
                                                                      4,
                                                            ),
                                                            ConstrainedBox(
                                                              constraints:
                                                                  BoxConstraints(
                                                                      maxWidth:
                                                                          itemWidth /
                                                                              3),
                                                              child: Text(
                                                                homePageController
                                                                    .featuredProducts[
                                                                        index]
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    height: 1.2,
                                                                    fontSize:
                                                                        desktopheading2 /
                                                                            1.5,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            Text(
                                                              homePageController
                                                                  .featuredProducts[
                                                                      index]
                                                                  .categoryName
                                                                  .first,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      desktopsubtext
                                                                  // /
                                                                  //     1.5
                                                                  ,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            FittedBox(
                                                              child: Row(
                                                                children: [
                                                                  homePageController
                                                                              .featuredProducts[index]
                                                                              .type ==
                                                                          'simple'
                                                                      ? Text(
                                                                          homePageController
                                                                              .featuredProducts[index]
                                                                              .salePrice
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                desktopsubtext
                                                                            // /
                                                                            //     1.5
                                                                            ,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Colors.blue,
                                                                          ),
                                                                        )
                                                                      : Text(
                                                                          homePageController
                                                                              .featuredProducts[index]
                                                                              .variations[0]
                                                                              .salePrice
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                desktopsubtext,
                                                                            fontWeight:
                                                                                FontWeight.bold
                                                                            // /
                                                                            //     1.5
                                                                            ,
                                                                            color:
                                                                                Colors.blue,
                                                                          ),
                                                                        ),
                                                                  SizedBox(
                                                                      width: 8),
                                                                  homePageController
                                                                              .featuredProducts[index]
                                                                              .type ==
                                                                          'simple'
                                                                      ? Text(
                                                                          homePageController
                                                                              .featuredProducts[index]
                                                                              .regularPrice
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            decoration:
                                                                                TextDecoration.lineThrough,
                                                                            fontSize:
                                                                                desktopsubtext
                                                                            // /
                                                                            //     2
                                                                            ,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        )
                                                                      : Text(
                                                                          homePageController
                                                                              .featuredProducts[index]
                                                                              .variations[0]
                                                                              .regularPrice
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            decoration:
                                                                                TextDecoration.lineThrough,
                                                                            fontSize:
                                                                                desktopsubtext
                                                                            // /
                                                                            //     2
                                                                            ,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                  // Text(
                                                                  //   "MRP 35,000",
                                                                  //   style:
                                                                  //       TextStyle(
                                                                  //     decoration:
                                                                  //         TextDecoration
                                                                  //             .lineThrough,
                                                                  //     fontSize:
                                                                  //         desktopsubtext /
                                                                  //             2,
                                                                  //     color: Colors
                                                                  //         .black,
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  // height: 32,
                                                                  // width: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color:
                                                                              Colors.green),
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
                                                                SizedBox(
                                                                    width: 8),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    print(
                                                                        "entered");
                                                                    launch(
                                                                        "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${homePageController.featuredProducts[index].name}");
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    // height: 32,
                                                                    // width: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                Colors.green),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            "images/whatsapp.png",
                                                                            width:
                                                                                12.0,
                                                                            height:
                                                                                12.0,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                          Text(
                                                                            "Order Now",
                                                                            style:
                                                                                TextStyle(fontSize: mobilebody, color: Colors.white),
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

                                //fproduct(),
                              ),
                              SizedBox(height: 15.0),
                              footer(),
                            ],
                          )
                        : SingleChildScrollView(
                            controller: _sController,
                            // physics: ScrollPhysics(),
                            child: Obx(() => Padding(
                                  padding: EdgeInsets.only(top: 80.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(children: [
                                        CarouselSlider(
                                            items: singleProductController
                                                .imageArray
                                                .map((imgUrl) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color(
                                                                  0xffF5F5F5)),
                                                      child: Center(
                                                        child: Image.network(
                                                          imgUrl,
                                                          //'https://res.cloudinary.com/oasis-it-store/image/upload/v1642171965/Media-Upload/asgsqmx18ujcc8jhuoek.png',
                                                          //imgUrl['image']['url'],

                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.50,
                                              // aspectRatio: 18 / 9,
                                              viewportFraction: 1,
                                              initialPage: 0,
                                              enableInfiniteScroll: false,
                                              reverse: false,
                                              // autoPlay: false,
                                              // autoPlayInterval: Duration(seconds: 3),
                                              // autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                                              autoPlayCurve:
                                                  Curves.fastOutSlowIn,
                                              enlargeCenterPage: false,
                                              onPageChanged: (index, reason) =>
                                                  setState(() =>
                                                      startingpage = index),
                                              scrollDirection: Axis.horizontal,
                                            )),
                                      ]),
                                      const SizedBox(height: 10),
                                      Center(
                                        child: AnimatedSmoothIndicator(
                                            onDotClicked: (index) =>
                                                _mycontroller.animateToPage(
                                                    index,
                                                    duration: const Duration(
                                                        milliseconds: 2000),
                                                    curve: Curves.decelerate),
                                            effect: const ScrollingDotsEffect(
                                                dotHeight: 7,
                                                dotWidth: 7,
                                                dotColor: Colors.green,
                                                activeDotColor:
                                                    Color(0xff014011)),
                                            activeIndex: startingpage,
                                            count: singleProductController
                                                .imageArray.length),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              singleProductController
                                                  .details['name'],
                                              //productdetaildata[0].title,
                                              maxLines: 3,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  letterSpacing: 0.2,
                                                  height: 1.5,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff000000)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15.0),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            singleProductController
                                                .details['shortDescription'],
                                            //productdetaildata[0].title,
                                            maxLines: 3,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                letterSpacing: 0.1,
                                                height: 1.5,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15.0),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 15, right: 15),
                                      //   child: Row(
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.center,
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     children: [
                                      //       Text(
                                      //           singleProductController
                                      //                       .details['type'] ==
                                      //                   'simple'
                                      //               ? '₹ ' +
                                      //                   singleProductController
                                      //                       .details[
                                      //                           'regularPrice']
                                      //                       .toString()
                                      //               : singleProductController
                                      //                   .details['variations']
                                      //                       [0]['regularPrice']
                                      //                   .toString(),
                                      //           style: GoogleFonts.poppins(
                                      //             textStyle: TextStyle(
                                      //                 decoration: TextDecoration
                                      //                     .lineThrough,
                                      //                 fontSize: 16,
                                      //                 color: Colors.grey,
                                      //                 fontWeight:
                                      //                     FontWeight.w400),
                                      //           )),
                                      //       SizedBox(
                                      //         width: 8.0,
                                      //       ),
                                      //       Text(
                                      //           singleProductController
                                      //                       .details['type'] ==
                                      //                   'simple'
                                      //               ? '₹ ' +
                                      //                   singleProductController
                                      //                       .details[
                                      //                           'salePrice']
                                      //                       .toString()
                                      //               : singleProductController
                                      //                   .details['variations']
                                      //                       [0]['salePrice']
                                      //                   .toString(),
                                      //           style: GoogleFonts.poppins(
                                      //             textStyle: TextStyle(
                                      //                 fontSize: 24,
                                      //                 color: Colors.green,
                                      //                 fontWeight:
                                      //                     FontWeight.w600),
                                      //           )),
                                      //     ],
                                      //   ),
                                      // ),
                                      // SizedBox(height: 15.0),

                                      Center(
                                          child: GestureDetector(
                                        onTap: () {
                                          print("entered");
                                          launch(
                                              "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${singleProductController.details['name']}");
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 6.0, right: 3.0),
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "images/whatsapp.png",
                                                  width: 14.0,
                                                  height: 14.0,
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Text(
                                                  "Order Now",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )

                                          // Container(
                                          //   height: 40,
                                          //   // width: 100,
                                          //   child: RaisedButton(
                                          //     onPressed: () {
                                          //       launch(
                                          //           "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${singleProductController.details['name']}");
                                          //     },
                                          //     color: Color(0xff54EA63),
                                          //     child: Row(
                                          //       children: [
                                          //         Text(
                                          //           "Whatsapp",
                                          //           style: GoogleFonts.poppins(
                                          //             textStyle: TextStyle(
                                          //               fontFamily: bigfamily,
                                          //               color: Colors.white,
                                          //               fontSize: 16,
                                          //               fontWeight: FontWeight.bold,
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //     shape: RoundedRectangleBorder(
                                          //         borderRadius:
                                          //             BorderRadius.circular(10)),
                                          //   ),
                                          // ),

                                          ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        "Specifications",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Obx(() => Column(
                                            children: [
                                              // for (var i = 0;
                                              //     i <
                                              //         singleProductController
                                              //             .details[
                                              //                 'specifications']
                                              //             .length;
                                              //     i++)
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Table(
                                                    border: const TableBorder(
                                                        horizontalInside:
                                                            BorderSide(
                                                                width: 0.3,
                                                                color: Colors
                                                                    .grey, //Color(0xffe2e2e2),
                                                                style:
                                                                    BorderStyle
                                                                        .none)),
                                                    defaultVerticalAlignment:
                                                        TableCellVerticalAlignment
                                                            .middle,
                                                    columnWidths: {
                                                      0: FractionColumnWidth(.5)
                                                    },
                                                    children: [
                                                      for (var specifications
                                                          in singleProductController
                                                                  .details[
                                                              'specifications'])
                                                        for (var specValues
                                                            in specifications[
                                                                    'specGroup']
                                                                [
                                                                'specNamesAndValues'])
                                                          TableRow(children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                10.0,
                                                              ),
                                                              child: Text(
                                                                  specValues[
                                                                      'name'],
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              Colors.grey))),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(
                                                                  specValues[
                                                                      'value'],
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              Colors.black))),
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15.0, 8.0, 8.0, 8.0),
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                productDetailsController
                                                    .fetchingProductDetails(
                                                        'Processor')
                                                    .then((value) {
                                                  Get.toNamed('/allproduct');
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16.0),
                                                child: Text(
                                                  "view all",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontFamily: smallfamily,
                                                    fontSize: 14,
                                                    color: Color(0xff333D61),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: (ResponsiveWidget
                                                    .isMediumScreen(context) ||
                                                ResponsiveWidget.isLargeScreen(
                                                    context))
                                            ? const EdgeInsets.only(top: 30)
                                            : const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: ishover
                                                    ? size.height / 2
                                                    : itemHeight,
                                                child: ScrollConfiguration(
                                                  behavior: ScrollConfiguration
                                                          .of(context)
                                                      .copyWith(dragDevices: {
                                                    PointerDeviceKind.mouse,
                                                    PointerDeviceKind.touch,
                                                  }),
                                                  child: Obx(
                                                    () => ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          homePageController
                                                              .featuredProducts
                                                              .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child:
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _sController.animateTo(
                                                                          0,
                                                                          duration: Duration(
                                                                              seconds:
                                                                                  1),
                                                                          curve:
                                                                              Curves.linear);

                                                                      homePageController
                                                                          .isLoading
                                                                          .value = true;
                                                                      singleProductController
                                                                          .fetchDetails(homePageController
                                                                              .featuredProducts[index]
                                                                              .id)
                                                                          .then((value) {
                                                                        singleProductController
                                                                            .details
                                                                            .refresh();

                                                                        singleProductController
                                                                            .indexValueOfImage
                                                                            .value = 0;
                                                                        homePageController
                                                                            .isLoading
                                                                            .value = false;
                                                                        Get.to(
                                                                          detail(),
                                                                        );
                                                                      });
                                                                    });
                                                                  },
                                                                  child:
                                                                      AnimatedContainer(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                            maxHeight:
                                                                                450.0),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              offset: Offset(0, 0.1),
                                                                              color: ishover ? Colors.grey : Colors.white,
                                                                              spreadRadius: 0,
                                                                              blurRadius: 1)
                                                                        ]),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            200),
                                                                    height: ishover
                                                                        ? itemHeight
                                                                        : size.height /
                                                                            2,
                                                                    padding: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        top: 0,
                                                                        bottom:
                                                                            5),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          homePageController
                                                                              .featuredProducts[index]
                                                                              .featuredProductImages[0],
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          height: ishover
                                                                              ? size.height / 3.5
                                                                              : size.height / 4,
                                                                        ),
                                                                        ConstrainedBox(
                                                                          constraints:
                                                                              BoxConstraints(maxWidth: itemWidth / 3),
                                                                          child:
                                                                              Text(
                                                                            homePageController.featuredProducts[index].name,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: TextStyle(
                                                                                height: 1.2,
                                                                                fontSize: desktopheading2 / 1.5,
                                                                                fontWeight: FontWeight.w600,
                                                                                color: Colors.black),
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
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
                                                                        FittedBox(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              homePageController.featuredProducts[index].type == 'simple'
                                                                                  ? Text(
                                                                                      homePageController.featuredProducts[index].salePrice.toString(),
                                                                                      style: TextStyle(
                                                                                        fontSize: desktopsubtext
                                                                                        // /
                                                                                        //     1.5
                                                                                        ,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        color: Colors.blue,
                                                                                      ),
                                                                                    )
                                                                                  : Text(
                                                                                      homePageController.featuredProducts[index].variations[0].salePrice.toString(),
                                                                                      style: TextStyle(
                                                                                        fontSize: desktopsubtext,
                                                                                        fontWeight: FontWeight.bold
                                                                                        // /
                                                                                        //     1.5
                                                                                        ,
                                                                                        color: Colors.blue,
                                                                                      ),
                                                                                    ),
                                                                              SizedBox(width: 8),
                                                                              homePageController.featuredProducts[index].type == 'simple'
                                                                                  ? Text(
                                                                                      homePageController.featuredProducts[index].regularPrice.toString(),
                                                                                      style: TextStyle(
                                                                                        decoration: TextDecoration.lineThrough,
                                                                                        fontSize: desktopsubtext
                                                                                        // /
                                                                                        //     2
                                                                                        ,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                    )
                                                                                  : Text(
                                                                                      homePageController.featuredProducts[index].variations[0].regularPrice.toString(),
                                                                                      style: TextStyle(
                                                                                        decoration: TextDecoration.lineThrough,
                                                                                        fontSize: desktopsubtext
                                                                                        // /
                                                                                        //     2
                                                                                        ,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                    ),
                                                                              // Text(
                                                                              //   "MRP 35,000",
                                                                              //   style:
                                                                              //       TextStyle(
                                                                              //     decoration:
                                                                              //         TextDecoration
                                                                              //             .lineThrough,
                                                                              //     fontSize:
                                                                              //         desktopsubtext /
                                                                              //             2,
                                                                              //     color: Colors
                                                                              //         .black,
                                                                              //   ),
                                                                              // ),
                                                                            ],
                                                                          ),
                                                                        ),
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
                                                                              decoration: BoxDecoration(color: Colors.green),
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
                                                                                launch("https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${homePageController.featuredProducts[index].name}");
                                                                              },
                                                                              child: Container(
                                                                                padding: EdgeInsets.all(5.0),
                                                                                // height: 32,
                                                                                // width: 70,
                                                                                decoration: BoxDecoration(color: Colors.green),
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
                                                                                        style: TextStyle(fontSize: mobilebody, color: Colors.white),
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

                                        //fproduct(),
                                      ),
                                      SizedBox(height: 15.0),
                                      footer(),
                                    ],
                                  ),
                                )),
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
