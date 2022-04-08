import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/pages/about_us.dart';
import 'package:oasis/pages/privacypolicy.dart';
import 'package:oasis/pages/service_center.dart';
import 'package:oasis/pages/textform.dart';
import 'package:url_launcher/url_launcher.dart';

class footer extends StatefulWidget {
  const footer({
    Key? key,
  }) : super(key: key);

  @override
  State<footer> createState() => _footerState();
}

class _footerState extends State<footer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: (ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isLargeScreen(context))
          ? Container(
              height: 280,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: smallfamily,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("OASIS India IT Store Pvt Ltd,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: smallfamily)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Old No 832, New No 72,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: smallfamily)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Anna Salai Main Road, Anna Salai,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: smallfamily)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Chennai, Tamil Nadu 600002,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: smallfamily)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Mobile: +91-98400 57413",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: smallfamily))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: Colors.grey,
                            ),
                            Text(
                              "Help",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  fontFamily: smallfamily),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(AboutUs());
                              },
                              child: Text(
                                "About Us",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => formfield()));
                                });
                              },
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => formfield()));
                                });
                              },
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                privaypolicy()));
                                  });
                                },
                                icon: Icon(Icons.chevron_right,
                                    color: Colors.white)),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => privaypolicy()));
                                });
                              },
                              child: Text(
                                "Privacy Policies ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/service-center');
                              },
                              child: Text(
                                "Service Centers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.follow_the_signs,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Follow Us on:",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: smallfamily,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch("https://www.facebook.com/oasisitstore");
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch("https://www.instagram.com/oasis_itstore/");
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Instagram",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: Text(
                                "Twitter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: Text(
                                "Youtube",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))
          : Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text("OASIS India IT Store Pvt Ltd,",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: smallfamily)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Old No 832, New No 72,",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: smallfamily)),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45.0),
                            child: Text("Anna Salai Main Road, Anna Salai,",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: smallfamily)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45.0),
                            child: Text("Chennai, Tamil Nadu 600002,",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: smallfamily)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Icon(
                                  Icons.phone_iphone,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Mobile: +91-98400 57413",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: smallfamily)),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.help,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Help",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: smallfamily),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                print('for check');
                                Get.to(AboutUs());
                              },
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('for check');
                                Get.to(AboutUs());
                              },
                              child: Text(
                                "About Us",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => formfield()));
                                });
                              },
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => formfield()));
                                });
                              },
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                privaypolicy()));
                                  });
                                },
                                icon: Icon(Icons.chevron_right,
                                    color: Colors.white)),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => privaypolicy()));
                                });
                              },
                              child: Text(
                                "Privacy Policies ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/service-center');
                              },
                              child: Text(
                                "Service Centers",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.follow_the_signs,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Follow Us on:",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: smallfamily,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch("https://www.facebook.com/oasisitstore");
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch("https://www.instagram.com/oasis_itstore/");
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: null,
                                child: Text(
                                  "Instagram",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: smallfamily,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: Text(
                                "Twitter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: Text(
                                "Youtube",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: smallfamily,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
