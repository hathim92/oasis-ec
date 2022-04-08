import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oasis/constants/style.dart';
import 'package:oasis/controllers/homepage_controller.dart';
import 'package:oasis/controllers/productDetails_controller.dart';
import 'package:url_launcher/url_launcher.dart';

HomePageController _homePageController = Get.find();
ProductDetailsController _productDetailsController = Get.find();

class SideNavBar extends StatefulWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

double appbarfontsize = 16;
const String _url = 'https://www.youtube.com/channel/UCC-Z8yPGIfpDP1ZbKZRjaaQ';
const String _fburl = 'https://www.facebook.com/oasisitstore';
const String _insurl = 'https://www.instagram.com/oasis_itstore/';
bool _isselectedtile = false;
bool _isHovered = false;
final _scaffoldKey = new GlobalKey<ScaffoldState>();
List hoverlist = [];
Color hovercolor = Color(0xff014011);

class _SideNavBarState extends State<SideNavBar> {
  HomePageController _homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var smallScreenGrid = currentWidth > 1201;
    var extraSmallScreenGrid = currentWidth > 1025;

    return Container(
        width: smallScreenGrid
            ? 300.0
            : extraSmallScreenGrid
                ? 270.0
                : 0.0,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: [Color(0xffcc2b5e), Color(0xff753a88)])
          ),
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  "images/oasis.png",
                  color: Color(0xff014011),
                  // height: currentWidth > 950 ? 60.0 : 30,
                  // width: currentWidth < 769 ? 80.0 : 150.0,
                  // height: currentWidth < 769 ? 80.0 : 150.0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.bottomLeft,
                initiallyExpanded: true,
                title: Text(
                  "All Categories",
                  style: TextStyle(
                      fontSize: tabheading2,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                collapsedIconColor: hovercolor,
                iconColor: hovercolor,
                childrenPadding: EdgeInsets.only(left: 20),
                children: [
                  for (var item in _homePageController.categoryList)
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        _productDetailsController
                            .fetchingProductDetails(item.id)
                            .then((value) {
                          Get.toNamed('/allproduct');
                          //Get.to(allproduct());
                        });
                      },
                      child: ExpansionTile(
                        title: Text(
                          item.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 14.0,
                        ),
                        children: [
                          for (var subCategory in item.children)
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                _productDetailsController
                                    .fetchingProductDetails(subCategory.id)
                                    .then((value) {
                                  Get.toNamed('/allproduct');
                                  //Get.to(allproduct());
                                });
                              },
                              child: ListTile(
                                title: Text(subCategory.id),
                              ),
                            )
                        ],
                      ),
                    ),
                  //SizedBox(height: 5),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _launchFBURL();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(),
                      child: Center(
                          child: Image.asset("images/facebook1.png",
                              fit: BoxFit.fill)),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      _launchINSTAURL();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Center(
                          child: Image.asset(
                        "images/instagram1.png",
                        fit: BoxFit.fill,
                      )),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _launchURL();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      child:
                          Image.asset("images/youtube1.png", fit: BoxFit.fill),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  void _launchFBURL() async {
    if (!await launch(_fburl)) throw 'Could not launch $_fburl';
  }

  void _launchINSTAURL() async {
    if (!await launch(_insurl)) throw 'Could not launch $_insurl';
  }
}




//  GestureDetector(
//                 onTap: () {
//                   Get.toNamed("/");
//                 },
//                 child: MouseRegion(
//                   onEnter: (enter) {
//                     setState(() {
//                       _isHovered = true;
//                       hoverlist.add("Home");
//                     });
//                   },
//                   onExit: (exit) {
//                     setState(() {
//                       _isHovered = false;
//                       hoverlist.remove("Home");
//                     });
//                   },
//                   child: Container(
//                     color: hoverlist.indexOf("Home") != -1 ? hovercolor : null,
//                     child: ListTile(
//                       leading: Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Icon(
//                           Icons.home,
//                           color: primarycolor,
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           SizedBox(width: 10),
//                           Text(
//                             "Home",
//                             style: TextStyle(
//                                 fontSize: appbarfontsize,
//                                 color: primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.chevron_right,
//                             color: primarycolor,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed("/fixturesandResults");
//                 },
//                 child: MouseRegion(
//                   onEnter: (enter) {
//                     setState(() {
//                       _isHovered = true;
//                       hoverlist.add("Fixtures & Results");
//                     });
//                   },
//                   onExit: (exit) {
//                     setState(() {
//                       _isHovered = false;
//                       hoverlist.remove("Fixtures & Results");
//                     });
//                   },
//                   child: Container(
//                     color: hoverlist.indexOf("Fixtures & Results") != -1
//                         ? hovercolor
//                         : null,
//                     child: ListTile(
//                       leading: Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Icon(
//                           Icons.schedule,
//                           color: primarycolor,
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           SizedBox(width: 10),
//                           Text(
//                             "Fixtures & Results",
//                             style: TextStyle(
//                                 fontSize: appbarfontsize,
//                                 color: primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.chevron_right,
//                             color: primarycolor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed("/photos");
//                 },
//                 child: MouseRegion(
//                   onEnter: (enter) {
//                     setState(() {
//                       _isHovered = true;
//                       hoverlist.add("Latest Photos");
//                     });
//                   },
//                   onExit: (exit) {
//                     setState(() {
//                       _isHovered = false;
//                       hoverlist.remove("Latest Photos");
//                     });
//                   },
//                   child: Container(
//                     color: hoverlist.indexOf("Latest Photos") != -1
//                         ? hovercolor
//                         : null,
//                     child: ListTile(
//                       // tileColor: _isselectedtile ? Colors.green : Colors.blue,
//                       leading: Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Icon(
//                           Icons.collections,
//                           color: primarycolor,
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           SizedBox(width: 10),
//                           Text(
//                             "Latest Photos",
//                             style: TextStyle(
//                                 fontSize: appbarfontsize,
//                                 color: primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.chevron_right,
//                             color: primarycolor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed("/videos");
//                 },
//                 child: MouseRegion(
//                   onEnter: (enter) {
//                     setState(() {
//                       _isHovered = true;
//                       hoverlist.add("Latest Videos");
//                     });
//                   },
//                   onExit: (exit) {
//                     setState(() {
//                       _isHovered = false;
//                       hoverlist.remove("Latest Videos");
//                     });
//                   },
//                   child: Container(
//                     color: hoverlist.indexOf("Latest Videos") != -1
//                         ? hovercolor
//                         : null,
//                     child: ListTile(
//                       leading: Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Icon(
//                           Icons.video_library,
//                           color: primarycolor,
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           SizedBox(width: 10),
//                           Text(
//                             "Latest Videos",
//                             style: TextStyle(
//                                 fontSize: appbarfontsize,
//                                 color: primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.chevron_right,
//                             color: primarycolor,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed("/news");
//                 },
//                 child: MouseRegion(
//                   onEnter: (enter) {
//                     setState(() {
//                       _isHovered = true;
//                       hoverlist.add("News");
//                     });
//                   },
//                   onExit: (exit) {
//                     setState(() {
//                       _isHovered = false;
//                       hoverlist.remove("News");
//                     });
//                   },
//                   child: Container(
//                     color: hoverlist.indexOf("News") != -1 ? hovercolor : null,
//                     child: ListTile(
//                       leading: Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Icon(
//                           Icons.feed,
//                           color: primarycolor,
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           SizedBox(width: 10),
//                           Text(
//                             "News",
//                             style: TextStyle(
//                                 fontSize: appbarfontsize,
//                                 color: primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.chevron_right,
//                             color: primarycolor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed("/aboutus");
//                 },
//                 child: MouseRegion(
//                   onEnter: (enter) {
//                     setState(() {
//                       _isHovered = true;
//                       hoverlist.add("About Us");
//                     });
//                   },
//                   onExit: (exit) {
//                     setState(() {
//                       _isHovered = false;
//                       hoverlist.remove("About Us");
//                     });
//                   },
//                   child: Container(
//                     color:
//                         hoverlist.indexOf("About Us") != -1 ? hovercolor : null,
//                     child: ListTile(
//                       leading: Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Icon(
//                           Icons.info,
//                           color: primarycolor,
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           SizedBox(width: 10),
//                           Text(
//                             "About Us",
//                             style: TextStyle(
//                                 fontSize: appbarfontsize,
//                                 color: primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.chevron_right,
//                             color: primarycolor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed("/contactus");
//                 },
//                 child: MouseRegion(
//                   onEnter: (enter) {
//                     setState(() {
//                       _isHovered = true;
//                       hoverlist.add("Contact Us");
//                     });
//                   },
//                   onExit: (exit) {
//                     setState(() {
//                       _isHovered = false;
//                       hoverlist.remove("Contact Us");
//                     });
//                   },
//                   child: Container(
//                     color: hoverlist.indexOf("Contact Us") != -1
//                         ? hovercolor
//                         : null,
//                     child: ListTile(
//                       leading: Padding(
//                         padding: const EdgeInsets.only(left: 15.0),
//                         child: Icon(
//                           Icons.contact_page,
//                           color: primarycolor,
//                         ),
//                       ),
//                       title: Row(
//                         children: [
//                           SizedBox(width: 10),
//                           Text(
//                             "Contact Us",
//                             style: TextStyle(
//                                 fontSize: appbarfontsize,
//                                 color: primarycolor,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.chevron_right,
//                             color: primarycolor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Center(
//                 child: Text(
//                   "Follow us",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: primarycolor,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),








































// ListView(children: [
//         SizedBox(
//           height: 20.0,
//         ),
        // Container(
        //   height: 80.0,
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.only(left: 20.0),
        //   child: Row(
        //     children: [
        //       // DecoratedBox(
        //       //   decoration: BoxDecoration(
        //       //     border: Border.all(
        //       //       color: Colors.white,
        //       //       width: 02.0,
        //       //     ),
        //       //     borderRadius: BorderRadius.circular(50.0),
        //       //   ),
        //       //   child: Padding(
        //       //     padding: EdgeInsets.all(04.0),
        //       //     child: ClipRRect(
        //       //       borderRadius: BorderRadius.circular(50.0),
        //       //       child: Image.network(
        //       //         'images/user.png',
        //       //         fit: BoxFit.cover,
        //       //         height: 55.0,
        //       //         width: 55.0,
        //       //       ),
        //       //     ),
        //       //   ),
        //       // ),
        //       // Container(
        //       //   padding: EdgeInsets.only(left: 10.0),
        //       //   child: Text(
        //       //     'Oasis',
        //       //     style: TextStyle(
        //       //         color: Colors.white,
        //       //         fontSize: 30.0,
        //       //         fontWeight: FontWeight.bold),
        //       //   ),
        //       // )
        //     ],
        //   ),
        // ),

        // Container(
        //   padding: EdgeInsets.only(left: 05.0, top: 08.0),
        //   child: Text(
        //     'Shopsnine',
        //     style: TextStyle(fontSize: 30.0, color: Colors.white),
        //   ),
        // )

      //   SizedBox(
      //     height: 20.0,
      //   ),
      //   Container(
      //     color: Colors.black12,
      //     child: TextButton(
      //       style: ElevatedButton.styleFrom(
      //         shape: new RoundedRectangleBorder(
      //           borderRadius: new BorderRadius.circular(0.0),
      //         ),
      //         padding: EdgeInsets.all(18.0),
      //       ),
      //       onPressed: () {},
      //       child: Column(
      //         children: [
      //           Row(
      //             children: [
      //               for (var item in _homePageController.categoryList)
      //                 Padding(
      //                   padding: EdgeInsets.only(
      //                       left: 15.0, top: 0.0, right: 0.0, bottom: 0.0),
      //                   child: Icon(
      //                     Icons.verified_user,
      //                     size: 23.0,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               Padding(
      //                 padding: EdgeInsets.only(
      //                     left: 10.0, top: 02.0, right: 10.0, bottom: 0.0),
      //                 child: Text(
      //                   'Custom Cooling Systems',
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
    
      
      // ]),