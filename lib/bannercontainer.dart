import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/models/featuredetail_Model.dart';
import 'package:oasis/pages/detailpage.dart';
import 'package:oasis/pages/productgrid.dart';
import 'package:oasis/pages/textform.dart';

class banner_container extends StatefulWidget {
  const banner_container({
    Key? key,
  }) : super(key: key);

  @override
  State<banner_container> createState() => _banner_containerState();
}

bool isHover = false;
Offset mousepos = new Offset(0, 0);

class _banner_containerState extends State<banner_container> {
  @override
  Widget build(BuildContext context) {
    return Material(
      //A big container wid height of 600,it has image and scroll

      //The Container Expanded with two rows.
      child: Container(
        margin: EdgeInsets.only(left: 120, right: 80),
        height: 590,
        child: Row(
          children: [
            Container(
              width: 575,
              child: MouseRegion(
                onEnter: (e) {
                  print("onEnter $e");
                  setState(() {
                    isHover = true;
                  });
                },
                onHover: (e) {
                  setState(() {
                    // mousepos += e.delta;
                    mousepos *= 0.12;
                  });
                },
                onExit: (e) {
                  print("onExit $e");
                  setState(() {
                    isHover = false;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20, left: 10),
                  child: Stack(
                    children: [
                      backImage(),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      MouseRegion(
                        onEnter: (e) {
                          setState(() {
                            isHover = true;
                          });
                        },
                        onHover: (e) {
                          setState(() {
                            // mousepos += e.delta;
                            mousepos *= 0.12;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            isHover = false;
                          });
                        },
                        child: Container(
                          height: 275,
                          width: 285,
                          child: Stack(
                            children: [
                              RowImage1(),
                              Positioned(
                                  top: 220,
                                  left: 40,
                                  child: Text(
                                    "GamerZone",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: 275,
                          width: 285,
                          child: Stack(
                            children: [
                              RowImage2(),
                              Positioned(
                                  top: 220,
                                  left: 40,
                                  child: Text(
                                    "Speaker",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 275,
                          width: 285,
                          child: Stack(
                            children: [
                              RowImage3(),
                              Positioned(
                                  top: 220,
                                  left: 40,
                                  child: Text(
                                    "RAM",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          height: 275,
                          width: 285,
                          child: Stack(
                            children: [
                              RowImage4(),
                              Positioned(
                                  top: 220,
                                  left: 40,
                                  child: Text(
                                    "SSD",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

backImage() {
  return AnimatedPositioned(
    duration: Duration(milliseconds: 1000),
    curve: Curves.easeInOut,
    height: isHover ? 650 : 590,
    width: 600,
    child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1611275484845-52a71f2b0a6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"))),
      width: 245,
    ),
  );
}

RowImage1() {
  return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isHover ? 290 : 275,
      width: isHover ? 300 : 285,
      // top: isHover ? -40 : 0,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1542751371-adc38448a05e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80"))),
        width: 285,
      ));
}

RowImage2() {
  return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isHover ? 290 : 275,
      width: isHover ? 300 : 285,
      // top: isHover ? -40 : 0,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1545454675-3531b543be5d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80"))),
        width: 285,
      ));
}

RowImage3() {
  return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isHover ? 290 : 275,
      width: isHover ? 300 : 285,
      // top: isHover ? -40 : 0,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1542978709-19c95dc3bc7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80"))),
        width: 285,
      ));
}

RowImage4() {
  return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isHover ? 290 : 275,
      width: isHover ? 300 : 285,
      // top: isHover ? -40 : 0,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1628557119555-fb3d687cc310?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=465&q=80"))),
        width: 285,
      ));
}
