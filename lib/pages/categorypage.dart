import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oasis/constants/style.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/pages/productgrid.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  HomePageController homePageController = Get.find();
  ProductDetailsController pd = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var largeScreenGrid = currentWidth > 1366;
    var smallScreenGrid = currentWidth > 1201;
    var tabScreenGrid = currentWidth > 769;
    var firstValue = homePageController.featuredCategories.length;
    print("firstVlaue length $firstValue");
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height) / 2.2;
    final double cardwidth = size.width / 2;
    double _height = 700.0;
    var tempArray = [];
    var ishover = false;

    return (ResponsiveWidget.isMediumScreen(context) ||
            ResponsiveWidget.isLargeScreen(context))
        ? Obx(() => homePageController.isLoading.value == true
            ? Container(
                width: 250.0,
                height: 250.0,
                child: const Center(child: CircularProgressIndicator()),
              )
            : Container(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 2.3, //2.335765,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: List.generate(
                      homePageController.featuredCategories.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        homePageController.isLoading.value = true;
                        pd
                            .fetchingProductDetails(
                                homePageController.featuredCategories[index].id)
                            .then((value) {
                          //Get.off(allproduct(),
                          homePageController.isLoading.value = false;
                          Get.offNamed('/allproduct',
                              arguments:
                                  homePageController.featuredCategories[0].id);
                        });
                      },
                      child: AnimatedContainer(
                        constraints: BoxConstraints(maxHeight: 450.0),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0.1),
                              color: tempArray.contains(homePageController
                                      .featuredCategories[index].name)
                                  ? Colors.grey
                                  : Colors.white,
                              spreadRadius: 0.5,
                              blurRadius: 1)
                        ]),
                        duration: Duration(milliseconds: 200),
                        height: tempArray.contains(homePageController
                                .featuredCategories[index].name)
                            ? itemHeight
                            : itemHeight + 50.0,
                        //: size.height / 1.5,
                        padding: EdgeInsets.only(left: 5, right: 5, top: 0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              homePageController.featuredCategories[index]
                                  .featuredCategoriesImages.first,
                              fit: BoxFit.fill,
                              height:
                                  ishover ? size.height / 3.5 : size.height / 4,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: itemWidth / 3),
                              child: Text(
                                homePageController
                                    .featuredCategories[index].name,
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
                            // Text(
                            //   homePageController.newArrivals[index].categoryName.first,
                            //   style: TextStyle(
                            //       fontSize: desktopsubtext
                            //       // /
                            //       //     1.5
                            //       ,
                            //       color: Colors.grey),
                            // ),
                            // FittedBox(
                            //   child: Row(
                            //     children: [
                            //       homePageController.newArrivals[index].type == 'simple'
                            //           ? Text(
                            //               homePageController.newArrivals[index].salePrice
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
                            //                   .newArrivals[index].variations[0].salePrice
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
                            //       homePageController.newArrivals[index].type == 'simple'
                            //           ? Text(
                            //               homePageController
                            //                   .newArrivals[index].regularPrice
                            //                   .toString(),
                            //               style: TextStyle(
                            //                 decoration: TextDecoration.lineThrough,
                            //                 fontSize: desktopsubtext
                            //                 // /
                            //                 //     2
                            //                 ,
                            //                 color: Colors.black,
                            //               ),
                            //             )
                            //           : Text(
                            //               homePageController.newArrivals[index]
                            //                   .variations[0].regularPrice
                            //                   .toString(),
                            //               style: TextStyle(
                            //                 decoration: TextDecoration.lineThrough,
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

                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       padding: EdgeInsets.all(5.0),
                            //       // height: 32,
                            //       // width: 70,
                            //       decoration: BoxDecoration(color: Colors.green),
                            //       child: Center(
                            //         child: Text(
                            //           "Order Now",
                            //           style: TextStyle(
                            //               fontSize: desktoplinktext,
                            //               // /
                            //               //     1.5,
                            //               color: Colors.white),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 8),
                            //     Container(
                            //       padding: EdgeInsets.all(5.0),
                            //       // height: 32,
                            //       // width: 70,
                            //       decoration: BoxDecoration(color: Colors.green),
                            //       child: Center(
                            //         child: Text(
                            //           "Order Now",
                            //           style: TextStyle(
                            //               fontSize: desktoplinktext,

                            //               ///
                            //               // 1.5,
                            //               color: Colors.white),
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ))
        : Container(
            child: Obx(
              () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: MediaQuery.of(context).size.width <= 320
                          ? 0.8
                          : 0.9, //itemWidth / itemHeight,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: homePageController.featuredCategories.length,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        homePageController.isLoading.value = true;
                        pd
                            .fetchingProductDetails(
                                homePageController.featuredCategories[index].id)
                            .then((value) {
                          //Get.off(allproduct(),
                          homePageController.isLoading.value = false;
                          Get.offNamed('/allproduct');
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
                                Container(
                                  child: Image.network(
                                    homePageController.featuredCategories[index]
                                        .featuredCategoriesImages[0],
                                    height: size.height / 4.5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                    homePageController
                                        .featuredCategories[index].name,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: mobileheading2,
                                        //height: 1.4,
                                        fontWeight: FontWeight.bold)),
                                // FittedBox(
                                //   child: Row(
                                //     children: [
                                //       Container(
                                //         padding: EdgeInsets.only(
                                //             left: 10, right: 10),
                                //         height: 32,
                                //         // width: 70,
                                //         decoration:
                                //             BoxDecoration(color: Colors.green),
                                //         child: Center(
                                //           child: Text(
                                //             "Learn More",
                                //             style: TextStyle(
                                //                 fontSize: mobilebody,
                                //                 color: Colors.white),
                                //           ),
                                //         ),
                                //       ),
                                //       SizedBox(width: 15),
                                //       GestureDetector(
                                //         onTap: () {
                                //           print("entered");
                                //           launch(
                                //               "https://wa.me/919840057413?text=Hi Oasis, I would like to know about this category. ${homePageController.featuredCategories[index].name}");
                                //         },
                                //         child: Container(
                                //           padding: EdgeInsets.only(
                                //               left: 6.0, right: 3.0),
                                //           height: 32,
                                //           // width: 70,
                                //           decoration: BoxDecoration(
                                //               color: Colors.green),
                                //           child: Center(
                                //             child: Row(
                                //               children: [
                                //                 Image.asset(
                                //                   "images/whatsapp.png",
                                //                   width: 12.0,
                                //                   height: 12.0,
                                //                 ),
                                //                 SizedBox(
                                //                   width: 3.0,
                                //                 ),
                                //                 Text(
                                //                   "Order Now",
                                //                   style: TextStyle(
                                //                       fontSize: mobilebody,
                                //                       color: Colors.white),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // )
                              ],
                            )),
                      ),
                    );
                  }),
            ),
          );

    // Container(
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: SizedBox(
    //             height: ishover ? size.height / 2 : itemHeight,
    //             child: Obx(
    //               () => homePageController.isLoading.value == true
    //                   ? Container(
    //                       width: 250.0,
    //                       height: 150.0,
    //                       child: const Center(
    //                           child: CircularProgressIndicator()),
    //                     )
    //                   : ListView.builder(
    //                       shrinkWrap: true,
    //                       scrollDirection: Axis.horizontal,
    //                       itemCount:
    //                           homePageController.featuredCategories.length,
    //                       itemBuilder: (BuildContext context, int index) {
    //                         return Padding(
    //                           padding: const EdgeInsets.all(10.0),
    //                           child: GestureDetector(
    //                               onTap: () {
    //                                 pd
    //                                     .fetchingProductDetails(
    //                                         homePageController
    //                                             .featuredCategories[0].id)
    //                                     .then((value) {
    //                                   //Get.off(allproduct(),
    //                                   Get.offNamed('/allproduct',
    //                                       arguments: homePageController
    //                                           .featuredCategories[0].id);
    //                                 });
    //                               },
    //                               child: AnimatedContainer(
    //                                 constraints:
    //                                     BoxConstraints(maxHeight: 450.0),
    //                                 decoration: BoxDecoration(
    //                                     color: Colors.white,
    //                                     boxShadow: [
    //                                       BoxShadow(
    //                                           offset: Offset(0, 0.1),
    //                                           color: ishover
    //                                               ? Colors.grey
    //                                               : Colors.white,
    //                                           spreadRadius: 0,
    //                                           blurRadius: 1)
    //                                     ]),
    //                                 duration: Duration(milliseconds: 200),
    //                                 height: ishover
    //                                     ? itemHeight
    //                                     : size.height / 2,
    //                                 padding: EdgeInsets.only(
    //                                     left: 5,
    //                                     right: 5,
    //                                     top: 0,
    //                                     bottom: 5),
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     Image.network(
    //                                       homePageController
    //                                           .featuredCategories[index]
    //                                           .featuredCategoriesImages
    //                                           .first,
    //                                       fit: BoxFit.fill,
    //                                       height: ishover
    //                                           ? size.height / 3.5
    //                                           : size.height / 3.2,
    //                                     ),
    //                                     ConstrainedBox(
    //                                       constraints: BoxConstraints(
    //                                           maxWidth: itemWidth / 2.8),
    //                                       child: Text(
    //                                         homePageController
    //                                             .featuredCategories[index]
    //                                             .name,
    //                                         textAlign: TextAlign.center,
    //                                         style: TextStyle(
    //                                             height: 1.2,
    //                                             fontSize:
    //                                                 desktopheading2 / 1.8,
    //                                             fontWeight: FontWeight.w600,
    //                                             color: Colors.black),
    //                                         maxLines: 2,
    //                                         overflow: TextOverflow.ellipsis,
    //                                       ),
    //                                     ),
    //                                     // FittedBox(
    //                                     //   child: Row(
    //                                     //     children: [
    //                                     //       homePageController
    //                                     //                   .featuredProducts[index]
    //                                     //                   .type ==
    //                                     //               'simple'
    //                                     //           ? Text(
    //                                     //               homePageController
    //                                     //                   .featuredProducts[index]
    //                                     //                   .salePrice
    //                                     //                   .toString(),
    //                                     //               style: TextStyle(
    //                                     //                 fontSize: desktopsubtext
    //                                     //                 // /
    //                                     //                 //     1.5
    //                                     //                 ,
    //                                     //                 fontWeight:
    //                                     //                     FontWeight.bold,
    //                                     //                 color: Colors.blue,
    //                                     //               ),
    //                                     //             )
    //                                     //           : Text(
    //                                     //               homePageController
    //                                     //                   .featuredProducts[index]
    //                                     //                   .variations[0]
    //                                     //                   .salePrice
    //                                     //                   .toString(),
    //                                     //               style: TextStyle(
    //                                     //                 fontSize: desktopsubtext,
    //                                     //                 fontWeight:
    //                                     //                     FontWeight.bold
    //                                     //                 // /
    //                                     //                 //     1.5
    //                                     //                 ,
    //                                     //                 color: Colors.blue,
    //                                     //               ),
    //                                     //             ),
    //                                     //       SizedBox(width: 8),
    //                                     //       homePageController
    //                                     //                   .featuredProducts[index]
    //                                     //                   .type ==
    //                                     //               'simple'
    //                                     //           ? Text(
    //                                     //               homePageController
    //                                     //                   .featuredProducts[index]
    //                                     //                   .regularPrice
    //                                     //                   .toString(),
    //                                     //               style: TextStyle(
    //                                     //                 decoration: TextDecoration
    //                                     //                     .lineThrough,
    //                                     //                 fontSize: desktopsubtext
    //                                     //                 // /
    //                                     //                 //     2
    //                                     //                 ,
    //                                     //                 color: Colors.black,
    //                                     //               ),
    //                                     //             )
    //                                     //           : Text(
    //                                     //               homePageController
    //                                     //                   .featuredProducts[index]
    //                                     //                   .variations[0]
    //                                     //                   .regularPrice
    //                                     //                   .toString(),
    //                                     //               style: TextStyle(
    //                                     //                 decoration: TextDecoration
    //                                     //                     .lineThrough,
    //                                     //                 fontSize: desktopsubtext
    //                                     //                 // /
    //                                     //                 //     2
    //                                     //                 ,
    //                                     //                 color: Colors.black,
    //                                     //               ),
    //                                     //             ),
    //                                     //       // Text(
    //                                     //       //   "MRP 35,000",
    //                                     //       //   style:
    //                                     //       //       TextStyle(
    //                                     //       //     decoration:
    //                                     //       //         TextDecoration
    //                                     //       //             .lineThrough,
    //                                     //       //     fontSize:
    //                                     //       //         desktopsubtext /
    //                                     //       //             2,
    //                                     //       //     color: Colors
    //                                     //       //         .black,
    //                                     //       //   ),
    //                                     //       // ),
    //                                     //     ],
    //                                     //   ),
    //                                     // ),
    //                                     Row(
    //                                       crossAxisAlignment:
    //                                           CrossAxisAlignment.center,
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.center,
    //                                       children: [
    //                                         Container(
    //                                           padding: EdgeInsets.all(5.0),
    //                                           // height: 32,
    //                                           // width: 70,
    //                                           decoration: BoxDecoration(
    //                                               color: Colors.green),
    //                                           child: Center(
    //                                             child: Text(
    //                                               "Learn More",
    //                                               style: TextStyle(
    //                                                   fontSize:
    //                                                       desktoplinktext,
    //                                                   // /
    //                                                   //     1.5,
    //                                                   color: Colors.white),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                         SizedBox(width: 8),
    //                                         GestureDetector(
    //                                           onTap: () {
    //                                             print("entered");
    //                                             launch(
    //                                                 "https://wa.me/919840057413?text=Hi Oasis, I would like to buy this product. ${homePageController.bestSellingProducts[index].name}");
    //                                           },
    //                                           child: Container(
    //                                             padding:
    //                                                 EdgeInsets.all(5.0),
    //                                             // height: 32,
    //                                             // width: 70,
    //                                             decoration: BoxDecoration(
    //                                                 color: Colors.green),
    //                                             child: Center(
    //                                               child: Row(
    //                                                 children: [
    //                                                   Image.asset(
    //                                                     "images/whatsapp.png",
    //                                                     width: 12.0,
    //                                                     height: 12.0,
    //                                                   ),
    //                                                   SizedBox(
    //                                                     width: 3.0,
    //                                                   ),
    //                                                   Text(
    //                                                     "Order Now",
    //                                                     style: TextStyle(
    //                                                         fontSize:
    //                                                             mobilebody,
    //                                                         color: Colors
    //                                                             .white),
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         )

    //                                         // Container(
    //                                         //   padding: EdgeInsets.all(5.0),
    //                                         //   // height: 32,
    //                                         //   // width: 70,
    //                                         //   decoration: BoxDecoration(
    //                                         //       color: Colors.green),
    //                                         //   child: Center(
    //                                         //     child: Text(
    //                                         //       "Order Now",
    //                                         //       style: TextStyle(
    //                                         //           fontSize:
    //                                         //               desktoplinktext,

    //                                         //           ///
    //                                         //           // 1.5,
    //                                         //           color: Colors.white),
    //                                         //     ),
    //                                         //   ),
    //                                         // )
    //                                       ],
    //                                     )
    //                                   ],
    //                                 ),
    //                               )),
    //                         );
    //                       },
    //                     ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
  }
}
