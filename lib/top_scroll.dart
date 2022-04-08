import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:oasis/homepage.dart';
import 'package:oasis/pages/productgrid.dart';

class topscroll extends StatefulWidget {
  const topscroll({
    Key? key,
  }) : super(key: key);

  @override
  State<topscroll> createState() => _topscrollState();
}

Color _color = Colors.white;
//var _showContainer = false;
Color _checkColor = Colors.white;

class _topscrollState extends State<topscroll> {
  HomePageController homePageController = Get.find();
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;

    return currentWidth >= 950
        ? Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 78.0, bottom: 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffe2e2e2)),
                  color: Colors.white,
                ),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu,
                          size: 22,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        PopupMenuButton(
                          padding: EdgeInsets.all(20),
                          itemBuilder: (
                            context,
                          ) =>
                              [
                            for (var item in homePageController.categoryList)
                              PopupMenuItem(
                                  padding: EdgeInsets.all(10),
                                  onTap: () {
                                    productDetailsController
                                        .fetchingProductDetails(item.id)
                                        .then((value) {
                                      Get.toNamed('/allproduct');
                                      //Get.to(allproduct());
                                    });
                                  },
                                  child: ListTile(
                                    title: Text(item.name),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 14.0,
                                    ),
                                  )),
                          ],
                          child: Row(
                            children: [
                              Text(
                                "ALL CATEGORIES",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "Montserrat",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 24,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),

                        // MouseRegion(
                        //   onEnter: (val) {
                        //     print(val);
                        //     setState(() {
                        //       _checkColor = Colors.red;
                        //       //showContainer = true;
                        //     });
                        //   },
                        //   onExit: (val) {
                        //     setState(() {
                        //       _checkColor = Colors.white;
                        //       //showContainer = false;
                        //     });
                        //   },
                        //   child: Text(
                        //     "All Categories",
                        //     style: TextStyle(
                        //         letterSpacing: 1,
                        //         fontFamily: "Montserrat",
                        //         color: _checkColor,
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: 14),
                        //   ),
                        // ),
                        // MouseRegion(
                        //   onEnter: (val) {
                        //     //print(val);
                        //     setState(() {
                        //       print("Hovered");
                        //       _showContainer = false;
                        //     });
                        //   },
                        //   onExit: (val) {
                        //     print("leave");
                        //   },
                        //   child: Text(
                        //     "ALL CATEGORIES",
                        //     style: TextStyle(
                        //         letterSpacing: 1,
                        //         fontFamily: "Montserrat",
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: 14),
                        //   ),
                        // ),

                        // SizedBox(
                        //   width: 15,
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       if (_color == Colors.white)
                        //         _color == Colors.yellow;
                        //       else
                        //         (_color == Colors.white);
                        //     });
                        //   },
                        //   child: Icon(
                        //     Icons.arrow_drop_down,
                        //     size: 24,
                        //     color: _color,
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        MouseRegion(
                          onHover: (val) {
                            setState(() {
                              _checkColor = Colors.green;
                              homePageController.showContainer.value = true;
                              homePageController.theFontColor.value =
                                  Colors.green;
                            });
                          },
                          onExit: (val) {
                            setState(() {
                              //homePageController.showContainer.value = false;
                              // homePageController.theFontColor.value =
                              //     Color(0xff676767);
                            });
                          },
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                homePageController.showContainer.value = false;
                              });
                            },
                            child: Text(
                              "Brand Store",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: homePageController
                                      .theFontColor.value, //Color(0xff676767),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.expand_more,
                          size: 22,
                          color: Color(0xff676767),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Laptop",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xff676767),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        Icon(
                          Icons.expand_more,
                          size: 22,
                          color: Color(0xff676767),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Peripheral",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xff676767),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        Icon(
                          Icons.expand_more,
                          size: 22,
                          color: Color(0xff676767),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Graphicscard",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xff676767),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        Icon(
                          Icons.expand_more,
                          size: 22,
                          color: Color(0xff676767),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Custom PC",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xff676767),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        Icon(
                          Icons.expand_more,
                          size: 22,
                          color: Color(0xff676767),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: homePageController.showContainer.value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 85.0, top: 155.0),
                  child: MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        homePageController.showContainer.value = true;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        homePageController.showContainer.value = false;
                        homePageController.theFontColor.value =
                            Color(0xff676767);
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        height: 400.0,
                        width: 800.0,
                        color: Colors.white, //.withOpacity(0.7),
                        child: SingleChildScrollView(
                            child: Obx(
                          () => GridView.count(
                              crossAxisCount: 4,
                              //childAspectRatio: 01.48,
                              mainAxisSpacing: 0.0,
                              crossAxisSpacing: 0.0,
                              shrinkWrap: true,
                              children: List.generate(
                                  homePageController.brandDetails.length,
                                  (index) {
                                // var iteratedValues =
                                //     homePageController.brandDetails[index];
                                return Container(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      homePageController
                                          .brandDetails[index].brand,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    for (var item in homePageController
                                        .brandDetails[index].categories)
                                      Tooltip(
                                        message: item,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              productDetailsController
                                                  .fetchingProductDetails(item)
                                                  .then((value) {
                                                //Get.off(allproduct(),
                                                Get.offNamed('/allproduct',
                                                    arguments:
                                                        homePageController
                                                            .featuredCategories[
                                                                0]
                                                            .id);
                                              });
                                            },
                                            child: Text(
                                              item,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ));
                              })),
                        ))),
                  ),
                ),
              ),
            ),
          ])
        : Container();
  }
}
