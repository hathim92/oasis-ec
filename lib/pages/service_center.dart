import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oasis/constants/responsive.dart';
import 'package:oasis/constants/style.dart';
import 'package:oasis/controllers/service_center_controller.dart';
import 'package:oasis/footer.dart';
import 'package:oasis/pages/filterpage.dart';
import 'package:oasis/pages/show_snackbar.dart';
import 'package:oasis/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Servicecenter extends StatefulWidget {
  const Servicecenter({Key? key}) : super(key: key);

  @override
  _ServicecenterState createState() => _ServicecenterState();
}

class _ServicecenterState extends State<Servicecenter> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: Mobileservice(),
        tabbody: Tabservice(),
        desktopBody: DesktopService());
  }
}

class Mobileservice extends StatefulWidget {
  const Mobileservice({Key? key}) : super(key: key);

  @override
  _MobileserviceState createState() => _MobileserviceState();
}

class _MobileserviceState extends State<Mobileservice> {
  ServiceController _serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width;
    final double itemHeight = size.height;
    return Scaffold(
      backgroundColor: primarycolor,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/serviceimage.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          "Find the Nearest Service Centers.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: mobileheading2 + 2.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              // decoration: BoxDecoration(
                              //   border: BorderSide(color: Colors.grey),
                              //   borderRadius: BorderRadius.circular(5),
                              // ),
                              child: Obx(
                                () => DropdownButton(
                                    underline: SizedBox(),
                                    iconSize: 24,
                                    iconEnabledColor: Colors.grey,
                                    dropdownColor: Colors.white,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    value:
                                        _serviceController.initialBrand.value,
                                    onChanged: (changeValue) {
                                      setState(() {
                                        print(changeValue);

                                        _serviceController.initialBrand.value =
                                            changeValue.toString();
                                      });
                                    },
                                    items: _serviceController.brandList
                                        .map((Valueitem) {
                                      return DropdownMenuItem(
                                          value: Valueitem,
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              width: 250,
                                              child: Text(
                                                Valueitem,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              )));
                                    }).toList()),
                              ),

                              // TextFormField(
                              //   decoration: InputDecoration(
                              //       fillColor: Colors.white,
                              //       filled: true,
                              //       hintText: 'Enter Your BrandName',
                              //       hintStyle: TextStyle(
                              //           fontSize: desktopsubtext,
                              //           fontWeight: FontWeight.w400,
                              //           color: Color(0xff707070)),
                              //       border: OutlineInputBorder(
                              //         borderSide:
                              //             const BorderSide(color: Colors.grey),
                              //         borderRadius: BorderRadius.circular(5),
                              //       )),
                              // ),
                            ),

                            // SizedBox(height: 10),
                            // SizedBox(
                            //   height: 30,
                            //   width: 200,
                            //   child: TextFormField(
                            //     decoration: InputDecoration(
                            //         fillColor: Colors.white,
                            //         filled: true,
                            //         hintText: 'Enter Search Location',
                            //         hintStyle: TextStyle(
                            //             fontSize: mobilesubtext,
                            //             fontWeight: FontWeight.w400,
                            //             color: Color(0xff707070)),
                            //         border: OutlineInputBorder(
                            //           borderSide:
                            //               const BorderSide(color: Colors.grey),
                            //           borderRadius: BorderRadius.circular(5),
                            //         )),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                            onTap: () {
                              if (_serviceController.initialBrand.value !=
                                  'Select Brand') {
                                _serviceController.fetchServiceCenterByBranch();
                              } else {
                                ShowSnackbar().showAlert('Error',
                                    "Select Brand", Icons.warning, Colors.red);
                              }
                            },
                            child: Container(
                              height: 42,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFF5E00),
                              ),
                              child: Center(
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                      fontSize: mobilesubtext + 5.0,
                                      fontWeight: FontWeight.w400,
                                      color: primarycolor),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Obx(
                            () => ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    _serviceController.serviceCenters.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    // constraints:
                                    //     BoxConstraints(maxHeight: 400.0),
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: primarycolor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0.2),
                                            color: Color(0xffACB4CD),
                                            spreadRadius: 0.4,
                                            blurRadius: 2)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            _serviceController
                                                .serviceCenters[index].name!,
                                            style: TextStyle(
                                                fontSize: mobileheading2,
                                                color: Color(0xff3D3D3D),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.60),
                                                  child: Text(
                                                    _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .addressLine1! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .addressLine2! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .city! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .state!,
                                                    style: TextStyle(
                                                        fontSize: mobilebody,
                                                        color:
                                                            Color(0xff3D3D3D),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () {
                                              launch(
                                                  "tel://${_serviceController.serviceCenters[index].phone.toString()}");
                                            },
                                            child: Wrap(
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.call,
                                                  color: Color(0xff575A8D),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  _serviceController
                                                      .serviceCenters[index]
                                                      .phone
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: mobilebody,
                                                      color: Color(0xff3D3D3D),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                // Text(
                                                //   "+91 98765 43210",
                                                //   style: TextStyle(
                                                //       fontSize: mobilebody,
                                                //       color: Color(0xff3D3D3D),
                                                //       fontWeight: FontWeight.w400),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: _serviceController
                                                    .serviceCenters[index]
                                                    .landline !=
                                                '',
                                            child: GestureDetector(
                                              onTap: () {
                                                launch(
                                                    "tel://${_serviceController.serviceCenters[index].landline.toString()}");
                                              },
                                              child: Wrap(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.call,
                                                    color: Color(0xff575A8D),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    _serviceController
                                                        .serviceCenters[index]
                                                        .landline
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: mobilebody,
                                                        color:
                                                            Color(0xff3D3D3D),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  // Text(
                                                  //   "+91 98765 43210",
                                                  //   style: TextStyle(
                                                  //       fontSize: mobilebody,
                                                  //       color: Color(0xff3D3D3D),
                                                  //       fontWeight: FontWeight.w400),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                              visible: _serviceController
                                                      .serviceCenters[index]!
                                                      .website !=
                                                  '',
                                              child: SizedBox(height: 10)),
                                          Visibility(
                                            visible: _serviceController
                                                    .serviceCenters[index]!
                                                    .website !=
                                                '',
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.public,
                                                  color: Color(0xff575A8D),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  _serviceController
                                                      .serviceCenters[index]!
                                                      .website!,
                                                  style: TextStyle(
                                                      fontSize: mobilebody,
                                                      color: Color(0xff3D3D3D),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.settings,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.60),
                                                child: Wrap(
                                                  children: [
                                                    for (var item
                                                        in _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .brands!)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Text(
                                                          item! + ',',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  mobilebody,
                                                              color: Color(
                                                                  0xff3D3D3D),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10.0),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.60),
                                                  child: InkWell(
                                                    onTap: () {
                                                      launch(_serviceController
                                                          .serviceCenters[index]
                                                          .map!);
                                                    },
                                                    child: Text(
                                                      'View On Map',
                                                      style: TextStyle(
                                                          fontSize: mobilebody,
                                                          color: Colors.blue,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Visibility(
                                              visible: _serviceController
                                                      .serviceCenters[index]!
                                                      .website !=
                                                  '',
                                              child: SizedBox(height: 10)),
                                          Visibility(
                                            visible: _serviceController
                                                    .serviceCenters[index]!
                                                    .description !=
                                                '',
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.public,
                                                  color: Color(0xff575A8D),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  _serviceController
                                                      .serviceCenters[index]!
                                                      .description!,
                                                  style: TextStyle(
                                                      fontSize: mobilebody,
                                                      color: Color(0xff3D3D3D),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                          // SizedBox(
                          //   // height: 500,
                          //   // height: 1000,
                          //   width: MediaQuery.of(context).size.width * 0.9,
                          //   child: GridView.builder(
                          //       physics: NeverScrollableScrollPhysics(),
                          //       shrinkWrap: true,
                          //       itemCount: 6,
                          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //           mainAxisSpacing: 10,
                          //           crossAxisSpacing: 10,
                          //           crossAxisCount: 2,
                          //           mainAxisExtent: itemHeight / 1.9
                          //           // childAspectRatio: 8 / 4
                          //           ),
                          //       itemBuilder: (context, index) {
                          //         return Container(
                          //           margin: EdgeInsets.all(8),
                          //           decoration: BoxDecoration(
                          //             color: primarycolor,
                          //             boxShadow: [
                          //               BoxShadow(
                          //                   offset: Offset(0, 0.2),
                          //                   color: Color(0xffACB4CD),
                          //                   spreadRadius: 0.4,
                          //                   blurRadius: 2)
                          //             ],
                          //           ),
                          //           child: Padding(
                          //             padding: EdgeInsets.all(20),
                          //             child: Column(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceEvenly,
                          //               children: [
                          //                 Text(
                          //                   "Lorem Ipsum Store",
                          //                   style: TextStyle(
                          //                       fontSize: 20,
                          //                       color: Color(0xff3D3D3D),
                          //                       fontWeight: FontWeight.w500),
                          //                 ),
                          //                 Row(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   mainAxisAlignment: MainAxisAlignment.start,
                          //                   children: [
                          //                     Icon(
                          //                       Icons.place,
                          //                       color: Color(0xff575A8D),
                          //                     ),
                          //                     SizedBox(width: 10),
                          //                     ConstrainedBox(
                          //                         constraints: BoxConstraints(
                          //                             maxWidth: MediaQuery.of(context)
                          //                                     .size
                          //                                     .width *
                          //                                 0.25),
                          //                         child: Text(
                          //                           "Dummy Address Lorem Ipsum Sit Amet,Dummy Pin, Dummy place.Dummy place.",
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               color: Color(0xff3D3D3D),
                          //                               fontWeight: FontWeight.w400),
                          //                         ))
                          //                   ],
                          //                 ),
                          //                 Wrap(
                          //                   // crossAxisAlignment:
                          //                   //     CrossAxisAlignment.start,
                          //                   // mainAxisAlignment: MainAxisAlignment.start,
                          //                   children: [
                          //                     Icon(
                          //                       Icons.call,
                          //                       color: Color(0xff575A8D),
                          //                     ),
                          //                     SizedBox(width: 10),
                          //                     Text(
                          //                       "+91 98765 43210",
                          //                       style: TextStyle(
                          //                           fontSize: 16,
                          //                           color: Color(0xff3D3D3D),
                          //                           fontWeight: FontWeight.w400),
                          //                     ),
                          //                     Text(
                          //                       "+91 98765 43210",
                          //                       style: TextStyle(
                          //                           fontSize: 16,
                          //                           color: Color(0xff3D3D3D),
                          //                           fontWeight: FontWeight.w400),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 Row(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   mainAxisAlignment: MainAxisAlignment.start,
                          //                   children: [
                          //                     Icon(
                          //                       Icons.public,
                          //                       color: Color(0xff575A8D),
                          //                     ),
                          //                     SizedBox(width: 10),
                          //                     Text(
                          //                       "www.loremipsum.com",
                          //                       style: TextStyle(
                          //                           fontSize: 16,
                          //                           color: Color(0xff3D3D3D),
                          //                           fontWeight: FontWeight.w400),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 Row(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   mainAxisAlignment: MainAxisAlignment.start,
                          //                   children: [
                          //                     Icon(
                          //                       Icons.settings,
                          //                       color: Color(0xff575A8D),
                          //                     ),
                          //                     SizedBox(width: 10),
                          //                     ConstrainedBox(
                          //                         constraints: BoxConstraints(
                          //                             maxWidth: MediaQuery.of(context)
                          //                                     .size
                          //                                     .width *
                          //                                 0.25),
                          //                         child: Text(
                          //                           "Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum..",
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               color: Color(0xff3D3D3D),
                          //                               fontWeight: FontWeight.w400),
                          //                         ))
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  footer(),
                ],
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: const Material(
              elevation: 0.0,
              child: topbar(),
            ),
          ),
        ],
      ),
    );
  }
}

class Tabservice extends StatefulWidget {
  const Tabservice({Key? key}) : super(key: key);

  @override
  _TabserviceState createState() => _TabserviceState();
}

class _TabserviceState extends State<Tabservice> {
  ServiceController _serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width;
    final double itemHeight = size.height;
    return Scaffold(
      backgroundColor: primarycolor,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/serviceimage.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Find the Nearest Centers.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: tabheading2,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter Your BrandName',
                                    hintStyle: TextStyle(
                                        fontSize: tabsubtext,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff707070)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              width: 250,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Enter Search Location',
                                    hintStyle: TextStyle(
                                        fontSize: tabsubtext,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff707070)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFF5E00),
                              ),
                              child: Center(
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                      fontSize: tabsubtext,
                                      fontWeight: FontWeight.w400,
                                      color: primarycolor),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          // height: 500,
                          // height: 1000,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Obx(
                            () => GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    _serviceController.serviceCenters.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        crossAxisCount: 2,
                                        mainAxisExtent: itemHeight / 2.2
                                        // childAspectRatio: 8 / 4
                                        ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: primarycolor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0.2),
                                            color: Color(0xffACB4CD),
                                            spreadRadius: 0.4,
                                            blurRadius: 2)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            _serviceController
                                                .serviceCenters[index].name!,
                                            style: TextStyle(
                                                fontSize: tabheading2,
                                                color: Color(0xff3D3D3D),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.25),
                                                  child: Text(
                                                    _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .addressLine1! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .addressLine2! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .city! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .state!,
                                                    style: TextStyle(
                                                        fontSize: tabbody / 1.5,
                                                        color:
                                                            Color(0xff3D3D3D),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ))
                                            ],
                                          ),
                                          Wrap(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.call,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                _serviceController
                                                    .serviceCenters[index].phone
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: tabbody / 1.5,
                                                    color: Color(0xff3D3D3D),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              // Text(
                                              //   "+91 98765 43210",
                                              //   style: TextStyle(
                                              //       fontSize: tabbody / 1.5,
                                              //       color: Color(0xff3D3D3D),
                                              //       fontWeight: FontWeight.w400),
                                              // ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.public,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                _serviceController
                                                    .serviceCenters[index]
                                                    .website!,
                                                style: TextStyle(
                                                    fontSize: tabbody / 1.5,
                                                    color: Color(0xff3D3D3D),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.settings,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              Wrap(
                                                children: [
                                                  for (var item
                                                      in _serviceController
                                                          .serviceCenters[index]
                                                          .brands!)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Text(
                                                        item! + ',',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff3D3D3D),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10.0),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                color: Color(0xff575A8D),
                                              ),
                                              SizedBox(width: 10),
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.60),
                                                  child: InkWell(
                                                    onTap: () {
                                                      launch(_serviceController
                                                          .serviceCenters[index]
                                                          .map!);
                                                    },
                                                    child: Text(
                                                      'View On Map',
                                                      style: TextStyle(
                                                          fontSize: mobilebody,
                                                          color: Colors.blue,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0,
                    child: Material(
                      elevation: 0.0,
                      child: topbar(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopService extends StatefulWidget {
  const DesktopService({Key? key}) : super(key: key);

  @override
  _DesktopServiceState createState() => _DesktopServiceState();
}

class _DesktopServiceState extends State<DesktopService> {
  ServiceController _serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width;
    final double itemHeight = size.height;
    return Scaffold(
      backgroundColor: primarycolor,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/serviceimage.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        Text(
                          "Find the Nearest Service Centers",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: desktopheading1,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Obx(
                                () => DropdownButton(
                                    underline: SizedBox(),
                                    iconSize: 24,
                                    iconEnabledColor: Colors.grey,
                                    dropdownColor: Colors.white,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                    value:
                                        _serviceController.initialBrand.value,
                                    onChanged: (changeValue) {
                                      setState(() {
                                        print(changeValue);

                                        _serviceController.initialBrand.value =
                                            changeValue.toString();
                                      });
                                    },
                                    items: _serviceController.brandList
                                        .map((Valueitem) {
                                      return DropdownMenuItem(
                                          value: Valueitem,
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              width: 250,
                                              child: Text(
                                                Valueitem,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              )));
                                    }).toList()),
                              ),

                              // TextFormField(
                              //   decoration: InputDecoration(
                              //       fillColor: Colors.white,
                              //       filled: true,
                              //       hintText: 'Enter Your BrandName',
                              //       hintStyle: TextStyle(
                              //           fontSize: desktopsubtext,
                              //           fontWeight: FontWeight.w400,
                              //           color: Color(0xff707070)),
                              //       border: OutlineInputBorder(
                              //         borderSide:
                              //             const BorderSide(color: Colors.grey),
                              //         borderRadius: BorderRadius.circular(5),
                              //       )),
                              // ),
                            ),

                            // const SizedBox(width: 20),
                            // SizedBox(
                            //   width: 300,
                            //   child: TextFormField(
                            //     decoration: InputDecoration(
                            //         fillColor: Colors.white,
                            //         filled: true,
                            //         hintText: 'Enter Search Location',
                            //         hintStyle: TextStyle(
                            //             fontSize: desktopsubtext,
                            //             fontWeight: FontWeight.w400,
                            //             color: Color(0xff707070)),
                            //         border: OutlineInputBorder(
                            //           borderSide:
                            //               const BorderSide(color: Colors.grey),
                            //           borderRadius: BorderRadius.circular(5),
                            //         )),
                            //   ),
                            // ),

                            const SizedBox(width: 20),
                            GestureDetector(
                                onTap: () {
                                  if (_serviceController.initialBrand.value !=
                                      'Select Brand') {
                                    _serviceController
                                        .fetchServiceCenterByBranch();
                                  } else {
                                    ShowSnackbar().showAlert(
                                        'Error',
                                        "Select Brand",
                                        Icons.warning,
                                        Colors.red);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffFF5E00),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                          fontSize: desktopbody,
                                          fontWeight: FontWeight.w400,
                                          color: primarycolor),
                                    ),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          // height: 500,
                          // height: 1000,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Obx(
                            () => GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    _serviceController.serviceCenters.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        crossAxisCount: 2,
                                        mainAxisExtent: 350),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: primarycolor,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0.2),
                                            color: Color(0xffACB4CD),
                                            spreadRadius: 0.4,
                                            blurRadius: 2)
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            _serviceController
                                                .serviceCenters[index].name!,
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xff3D3D3D),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                color: Color(0xff575A8D),
                                              ),
                                              const SizedBox(width: 5.0),
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.25),
                                                  child: Text(
                                                    _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .addressLine1! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .addressLine2! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .city! +
                                                        ', ' +
                                                        _serviceController
                                                            .serviceCenters[
                                                                index]
                                                            .serviceLocation!
                                                            .state!,
                                                    style: const TextStyle(
                                                        fontSize:
                                                            16, //tabbody / 1.5,
                                                        color:
                                                            Color(0xff3D3D3D),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ))
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              launch(
                                                  "tel://${_serviceController.serviceCenters[index].phone.toString()}");
                                            },
                                            child: Wrap(
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.call,
                                                  color: Color(0xff575A8D),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(
                                                  _serviceController
                                                      .serviceCenters[index]
                                                      .phone
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Color(0xff3D3D3D),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                // Text(
                                                //   "+91 98765 43210",
                                                //   style: TextStyle(
                                                //       fontSize: desktopbody,
                                                //       color: Color(0xff3D3D3D),
                                                //       fontWeight: FontWeight.w400),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: _serviceController
                                                    .serviceCenters[index]
                                                    .landline !=
                                                '',
                                            child: GestureDetector(
                                              onTap: () {
                                                launch(
                                                    "tel://${_serviceController.serviceCenters[index].landline.toString()}");
                                              },
                                              child: Wrap(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.call,
                                                    color: Color(0xff575A8D),
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Text(
                                                    _serviceController
                                                        .serviceCenters[index]
                                                        .landline
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16.0,
                                                        color:
                                                            Color(0xff3D3D3D),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  // Text(
                                                  //   "+91 98765 43210",
                                                  //   style: TextStyle(
                                                  //       fontSize: desktopbody,
                                                  //       color: Color(0xff3D3D3D),
                                                  //       fontWeight: FontWeight.w400),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: _serviceController
                                                    .serviceCenters[index]!
                                                    .website !=
                                                '',
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.public,
                                                  color: Color(0xff575A8D),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(
                                                  _serviceController
                                                      .serviceCenters[index]
                                                      .website!,
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Color(0xff3D3D3D),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.settings,
                                                color: Color(0xff575A8D),
                                              ),
                                              const SizedBox(width: 5.0),
                                              Wrap(
                                                children: [
                                                  for (var item
                                                      in _serviceController
                                                          .serviceCenters[index]
                                                          .brands!)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Text(
                                                        item! + ',',
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff3D3D3D),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                color: Color(0xff575A8D),
                                              ),
                                              const SizedBox(width: 5.0),
                                              ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.25),
                                                  child: InkWell(
                                                    onTap: () {
                                                      launch(_serviceController
                                                          .serviceCenters[index]
                                                          .map!);
                                                    },
                                                    child: const Text(
                                                      'View On Map',
                                                      style: const TextStyle(
                                                          fontSize:
                                                              16, //tabbody / 1.5,
                                                          color: Colors.blue,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Visibility(
                                            visible: _serviceController
                                                    .serviceCenters[index]!
                                                    .description !=
                                                '',
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.public,
                                                  color: Color(0xff575A8D),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(
                                                  _serviceController
                                                      .serviceCenters[index]
                                                      .description!,
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Color(0xff3D3D3D),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  footer(),
                ],
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: Material(
              elevation: 0.0,
              child: topbar(),
            ),
          ),
        ],
      ),
    );
  }
}
