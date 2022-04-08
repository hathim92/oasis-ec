import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/constants/style.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/single_product_controller.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/models/featuredetail_Model.dart';
import 'package:oasis/pages/detailpage.dart';
import 'package:oasis/pages/productgrid.dart';
import 'package:oasis/pages/responsive_card.dart';
import 'package:url_launcher/url_launcher.dart';

class imgcontain extends StatefulWidget {
  const imgcontain({Key? key}) : super(key: key);

  @override
  _imgcontainState createState() => _imgcontainState();
}

bool isHover = false;
Offset mousepos = new Offset(0, 0);

class _imgcontainState extends State<imgcontain> {
  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.find();
    SingleProductController singleProductController =
        Get.put(SingleProductController());
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height) / 2.2;
    final double cardwidth = size.width / 2;
    double _height = 700.0;
    return (ResponsiveWidget.isMediumScreen(context) ||
            ResponsiveWidget.isLargeScreen(context))
        ? Material(
            color: Colors.white,
            child: Row(
              children: [
                //A vertical Bannner with height 600
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      child: Obx(
                    () => GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: List.generate(
                          homePageController.newArrivals.length, (index) {
                        return GestureDetector(
                            onTap: () {
                              homePageController.isLoading.value = true;
                              singleProductController
                                  .fetchDetails(
                                      homePageController.newArrivals[index].id)
                                  .then((value) {
                                singleProductController.details.refresh();
                                setState(() {
                                  singleProductController
                                      .indexValueOfImage.value = 0;
                                  homePageController.isLoading.value = false;
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
                              height: ishover ? itemHeight : size.height / 2,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 0, bottom: 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network(
                                    homePageController.newArrivals[index]
                                        .newArrivalImages.first,
                                    fit: BoxFit.fill,
                                    height: ishover
                                        ? size.height / 3.5
                                        : size.height / 4,
                                  ),
                                  ConstrainedBox(
                                    constraints:
                                        BoxConstraints(maxWidth: itemWidth / 3),
                                    child: Text(
                                      homePageController
                                          .newArrivals[index].name,
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
                                        .newArrivals[index].categoryName.first,
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
                                  //                   .newArrivals[index].type ==
                                  //               'simple'
                                  //           ? Text(
                                  //               homePageController
                                  //                   .newArrivals[index]
                                  //                   .salePrice
                                  //                   .toString(),
                                  //               style: TextStyle(
                                  //                 fontSize: desktopsubtext
                                  //                 // /
                                  //                 //     1.5
                                  //                 ,
                                  //                 fontWeight: FontWeight.bold,
                                  //                 color: Colors.blue,
                                  //               ),
                                  //             )
                                  //           : Text(
                                  //               homePageController
                                  //                   .newArrivals[index]
                                  //                   .variations[0]
                                  //                   .salePrice
                                  //                   .toString(),
                                  //               style: TextStyle(
                                  //                 fontSize: desktopsubtext,
                                  //                 fontWeight: FontWeight.bold
                                  //                 // /
                                  //                 //     1.5
                                  //                 ,
                                  //                 color: Colors.blue,
                                  //               ),
                                  //             ),
                                  //       SizedBox(width: 8),
                                  //       homePageController
                                  //                   .newArrivals[index].type ==
                                  //               'simple'
                                  //           ? Text(
                                  //               homePageController
                                  //                   .newArrivals[index]
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
                                  //                   .newArrivals[index]
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
                                  //       // Text(
                                  //       //   "MRP 35,000",
                                  //       //   style:
                                  //       //       TextStyle(
                                  //       //     decoration:
                                  //       //         TextDecoration
                                  //       //             .lineThrough,
                                  //       //     fontSize:
                                  //       //         desktopsubtext /
                                  //       //             2,
                                  //       //     color: Colors
                                  //       //         .black,
                                  //       //   ),
                                  //       // ),
                                  //     ],
                                  //   ),
                                  // ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        // height: 32,
                                        // width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.green),
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
                                              "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${homePageController.newArrivals[index].name}");
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
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  "Order Now",
                                                  style: TextStyle(
                                                      fontSize: desktoplinktext,

                                                      ///
                                                      // 1.5,
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
                            ));
                      }),
                    ),
                  )),
// Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                     ),

// //Thsis column for  top 4 categories.
//                     child: Flexible(
//                       //fit: FlexFit.loose,
//                       child: GridView.builder(
//                           shrinkWrap: true,
//                           // physics: NeverScrollableScrollPhysics(),
//                           itemCount: featuredata.length - 6,
//                           gridDelegate:
//                               SliverGridDelegateWithMaxCrossAxisExtent(
//                                   crossAxisSpacing: 17,
//                                   mainAxisSpacing: 6,
//                                   maxCrossAxisExtent: 400,
//                                   childAspectRatio: 2.2 / 1.8),
//                           itemBuilder: (context, index) => Container(
//                                 height: 500.0,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey.withOpacity(0.30),
//                                       spreadRadius: 0,
//                                       blurRadius: 20,
//                                       offset: Offset(
//                                           0, 10), // changes position of shadow
//                                     ),
//                                   ],
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height: 100,
//                                       width: 100,
//                                       padding: EdgeInsets.only(top: 15.0),
//                                       child: Image.asset(
//                                         featuredata[index].Image,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 15),
//                                       child: Text(
//                                         featuredata[index].Name,
//                                         maxLines: 1,
//                                         style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w600)),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 5),
//                                       child: Text(
//                                         featuredata[index].Category,
//                                         style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                           fontSize: 13,
//                                           color: Color(0xff9E9E9E),
//                                         )),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 5),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           // Image.asset(
//                                           //   "icons/rupees.svg",
//                                           //   height: 13,
//                                           //   color: Color(0xff007BC4),
//                                           // ),
//                                           Text(
//                                             '₹ ' + featuredata[index].Price,
//                                             style: GoogleFonts.poppins(
//                                                 textStyle: TextStyle(
//                                                     fontSize: 13,
//                                                     fontWeight: FontWeight.w500,
//                                                     color: Color(0xff007BC4))),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )),
//                     ),
//                   ),
                ),
              ],
            ))
        : Material(
            color: Colors.white,
            child: Container(
                child: Obx(
              () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: itemWidth / itemHeight,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: homePageController.newArrivals.length,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        homePageController.isLoading.value = true;
                        singleProductController
                            .fetchDetails(
                                homePageController.newArrivals[index].id)
                            .then((value) {
                          singleProductController.details.refresh();
                          setState(() {
                            singleProductController.indexValueOfImage.value = 0;
                            homePageController.isLoading.value = false;
                            Get.to(
                              detail(),
                            );
                          });
                        });
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 8, right: 8),
                            // color: isMobile(context) ? Colors.red : Colors.green,

                            // width: size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  homePageController
                                      .newArrivals[index].newArrivalImages[0],
                                  height: size.height / 4.5,
                                  fit: BoxFit.cover,
                                ),
                                Text(homePageController.newArrivals[index].name,
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: mobileheading2,
                                        height: 1.4,
                                        fontWeight: FontWeight.bold)),
                                Center(
                                  child: Text(
                                    homePageController
                                        .newArrivals[index].categoryName.first,
                                    style: TextStyle(
                                        fontSize: mobilebody,
                                        color: Colors.grey),
                                  ),
                                ),
                                // FittedBox(
                                //   child: Row(
                                //     children: [
                                //       homePageController
                                //                   .newArrivals[index].type ==
                                //               'simple'
                                //           ? Text(
                                //               homePageController
                                //                   .newArrivals[index].salePrice
                                //                   .toString(),
                                //               style: TextStyle(
                                //                 decoration:
                                //                     TextDecoration.lineThrough,
                                //                 fontSize: mobilesubtext,
                                //                 color: Colors.black,
                                //               ),
                                //             )
                                //           : Text(
                                //               homePageController
                                //                   .newArrivals[index]
                                //                   .variations[0]
                                //                   .salePrice
                                //                   .toString(),
                                //               style: TextStyle(
                                //                 decoration:
                                //                     TextDecoration.lineThrough,
                                //                 fontSize: mobilesubtext,
                                //                 color: Colors.black,
                                //               ),
                                //             ),
                                //       SizedBox(width: 5),
                                //       homePageController
                                //                   .newArrivals[index].type ==
                                //               'simple'
                                //           ? Text(
                                //               homePageController
                                //                   .newArrivals[index]
                                //                   .regularPrice
                                //                   .toString(),
                                //               style: TextStyle(
                                //                 fontSize: mobilebody,
                                //                 fontWeight: FontWeight.bold,
                                //                 color: Colors.blueAccent,
                                //               ),
                                //             )
                                //           : Text(
                                //               homePageController
                                //                   .newArrivals[index]
                                //                   .variations[0]
                                //                   .regularPrice
                                //                   .toString(),
                                //               style: TextStyle(
                                //                 fontSize: mobilebody,
                                //                 fontWeight: FontWeight.bold,
                                //                 color: Colors.blueAccent,
                                //               ),
                                //             )
                                //     ],
                                //   ),
                                // ),

                                FittedBox(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        height: 32,
                                        // width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            "Learn More",
                                            style: TextStyle(
                                                fontSize: mobilebody,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      GestureDetector(
                                        onTap: () {
                                          print("entered");
                                          launch(
                                              "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${homePageController.newArrivals[index].name}");
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 6.0, right: 3.0),
                                          height: 32,
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
                                  ),
                                )
                              ],
                            )),
                      ),
                    );
                  }),
            )),
          );
  }
}

contImg() {
  return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      height: isHover ? 490 : 300,
      width: 300,
      curve: Curves.easeInOut,
      child: Container(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Color(0xff0072B6), BlendMode.modulate),
          child: Expanded(
            child: Image.asset(
              "images/homepodmini.jpg",
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
        ),
      ));
}

//   child: Container(
//     color: Colors.red,
//     margin: EdgeInsets.only(left: 80, right: 80),
//     height: 600,
//     width: 1240,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Column(
//           children: [
//             Container(
//               height: 236,
//               width: 187,
//               color: Colors.green,
//               child: Stack(
//                 children: [],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 338,
//               width: 187,
//               color: Colors.brown,
//               child: Column(
//                 children: [],
//               ),
//             )
//           ],
//         ),
//         Row(
//           children: [
//             Container(
//               color: Colors.yellow,
//               height: 27,
//               width: 1107.5,
//               child: Text("data"),
//             )
//           ],
//         )
//       ],
//     ),
//   ),
// );

//  Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Expanded(
//                         child: SizedBox(
//                             height: 520.0,
//                             child: GridView.count(
//                                 physics: NeverScrollableScrollPhysics(),
//                                 crossAxisCount: 4,
//                                 mainAxisSpacing: 5,
//                                 crossAxisSpacing: 5,
//                                 children: List.generate(8, (index) {
//                                   return Container(
//                                     margin: EdgeInsets.only(
//                                         right: 10, left: 10),
//                                     // decoration: BoxDecoration(
//                                     //   borderRadius: BorderRadius.circular(28),
//                                     //   boxShadow: [
//                                     //     BoxShadow(
//                                     //         offset: Offset(0, 1),
//                                     //         color: Color(0x80BDC6D9),
//                                     //         blurRadius: 1)
//                                     //   ],
//                                     // ),

//                                     // height: 10,
//                                     width: 200,

//                                     child: FittedBox(
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       detail(
//                                                           details:
//                                                               detaildata[
//                                                                   index])));
//                                         },
//                                         child: Card(
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       20)),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     color:
//                                                         Color(0xffe2e2e2)),
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         20)),
//                                             padding: EdgeInsets.all(5),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceEvenly,
//                                               children: [
//                                                 Center(
//                                                   child: Image.asset(
//                                                       "images/GraphicsCard.png",
//                                                       height: 130,
//                                                       width: 160,
//                                                       fit: BoxFit.contain),
//                                                 ),
//                                                 Text("Graphics Card",
//                                                     style:
//                                                         GoogleFonts.poppins(
//                                                       textStyle: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight
//                                                                   .w500,
//                                                           color: Color(
//                                                               0xff333D61),
//                                                           fontSize: 18),
//                                                     )),
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .center,
//                                                   children: [
//                                                     SvgPicture.asset(
//                                                       "icons/rupees.svg",
//                                                       height: 13,
//                                                       color:
//                                                           Color(0xff323232),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 2,
//                                                     ),
//                                                     Text(
//                                                       "8,000",
//                                                       style: TextStyle(
//                                                           color: Color(
//                                                               0xff323232),
//                                                           fontSize: 16,
//                                                           fontFamily:
//                                                               smallfamily,
//                                                           fontWeight:
//                                                               FontWeight
//                                                                   .bold),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 // Container(
//                                                 //   height: 40,
//                                                 //   width: 150,
//                                                 //   child: RaisedButton(
//                                                 //     onPressed: () {
//                                                 //       setState(() {
//                                                 //         Navigator.of(
//                                                 //                 context)
//                                                 //             .push(MaterialPageRoute(
//                                                 //                 builder:
//                                                 //                     (context) =>
//                                                 //                         formfield()));
//                                                 //       });
//                                                 //     },
//                                                 //     color:
//                                                 //         Color(0xff54EA63),
//                                                 //     child: Text(
//                                                 //       "Get Quote",
//                                                 //       style: TextStyle(
//                                                 //         fontFamily:
//                                                 //             bigfamily,
//                                                 //         color: Colors.white,
//                                                 //         fontSize: 18,
//                                                 //         fontWeight:
//                                                 //             FontWeight.bold,
//                                                 //       ),
//                                                 //     ),
//                                                 //     shape: RoundedRectangleBorder(
//                                                 //         borderRadius:
//                                                 //             BorderRadius
//                                                 //                 .circular(
//                                                 //                     10)),
//                                                 //   ),
//                                                 // )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }))),
//                       ),
//                     ],
//                   ),
