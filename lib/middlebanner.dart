import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/pages/detailpage.dart';
import 'package:oasis/pages/productslist.dart';

class middle_banner extends StatefulWidget {
  const middle_banner({
    Key? key,
  }) : super(key: key);

  @override
  State<middle_banner> createState() => _middle_bannerState();
}

bool isHover = false;
Offset mousepos = new Offset(0, 0);

class _middle_bannerState extends State<middle_banner> {
  @override
  Widget build(BuildContext context) {
    return (ResponsiveWidget.isMediumScreen(context) ||
            ResponsiveWidget.isLargeScreen(context))
        ? FittedBox(
            fit: BoxFit.fill,
            child: Container(
              margin: EdgeInsets.only(left: 80, right: 80),
              height: 396,
              width: 1190,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: 396,
                    width: 396,
                    color: Color(0xffD61A3C),
                    child: MouseRegion(
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
                      child: Stack(
                        children: [
                          Image1(),
                          Positioned(
                              left: 20,
                              top: 20,
                              child: Text(
                                "HiTech Display",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              )),
                          Positioned(
                              left: 20,
                              top: 50,
                              child: Text(
                                "SONIC DISPLAY",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),
                          Positioned(
                              left: 20,
                              top: 100,
                              child: RaisedButton(
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xFF0D47A1),
                                          Color(0xFF1976D2),
                                          Color(0xFF42A5F5),
                                        ],
                                      ),
                                    ),
                                    child: Text("Shop Now"),
                                  )))
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 198,
                        width: 496,
                        color: Color(0xffF6F6F6),
                        child: MouseRegion(
                          onEnter: (f) {
                            setState(() {
                              isHover = true;
                            });
                          },
                          onHover: (f) {
                            setState(() {
                              // mousepos += f.delta;
                              mousepos *= 0.12;
                            });
                          },
                          onExit: (f) {
                            setState(() {
                              isHover = false;
                            });
                          },
                          child: Stack(children: [
                            // Image.asset("images/airpod3.png"),
                            Image2(),
                            Positioned(
                              left: 20,
                              top: 20,
                              child: Text(
                                "Apple",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 20,
                                top: 50,
                                child: Text(
                                  "NEW AIRPODS 3 PRO",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                                )),
                          ]),
                        ),
                      ),
                      Container(
                        height: 198,
                        width: 496,
                        color: Colors.black,
                        child: MouseRegion(
                          child: Stack(
                            children: [
                              Image3(),
                              Positioned(
                                left: 20,
                                top: 20,
                                child: Text(
                                  "Sony",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 20,
                                  top: 50,
                                  child: Text(
                                    "WAlkMAN HEADSET ULTRA",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 396,
                    width: 298,
                    color: Color(0xffFFFFFF),
                    child: MouseRegion(
                      onEnter: (f) {
                        setState(() {
                          isHover = true;
                        });
                      },
                      onHover: (f) {
                        setState(() {
                          // mousepos += f.delta;
                          mousepos *= 0.12;
                        });
                      },
                      onExit: (f) {
                        setState(() {
                          isHover = false;
                        });
                      },
                      child: Stack(children: [
                        // Image.asset(
                        //   "images/pc.jpg",
                        //   height: 396,
                        // )
                        Image4(),
                        Positioned(
                            left: 24,
                            top: 20,
                            child: Text(
                              "Asus",
                              style: GoogleFonts.poppins(
                                textStyle:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            )),
                        Positioned(
                            left: 20,
                            top: 50,
                            child: Text(
                              " Builded PC",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Column(
            children: [
              Container(
                height: 396,
                width: 396,
                color: Color(0xffD61A3C),
                child: MouseRegion(
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
                  child: Stack(
                    children: [
                      Image1(),
                      Positioned(
                          left: 20,
                          top: 20,
                          child: Text(
                            "HiTech Display",
                            style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          )),
                      Positioned(
                          left: 20,
                          top: 50,
                          child: Text(
                            "SONIC DISPLAY",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                      Positioned(
                          left: 20,
                          top: 100,
                          child: RaisedButton(
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ],
                                  ),
                                ),
                                child: Text("Shop Now"),
                              )))
                    ],
                  ),
                ),
              ),
              Container(
                height: 198,
                width: 496,
                color: Colors.black,
                child: MouseRegion(
                  child: Stack(
                    children: [
                      Image3(),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Text(
                          "Sony",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 20,
                          top: 50,
                          child: Text(
                            "WAlkMAN HEADSET ULTRA",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                height: 198,
                width: 496,
                color: Color(0xffF6F6F6),
                child: MouseRegion(
                  onEnter: (f) {
                    setState(() {
                      isHover = true;
                    });
                  },
                  onHover: (f) {
                    setState(() {
                      // mousepos += f.delta;
                      mousepos *= 0.12;
                    });
                  },
                  onExit: (f) {
                    setState(() {
                      isHover = false;
                    });
                  },
                  child: Stack(children: [
                    // Image.asset("images/airpod3.png"),
                    Image2(),
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Text(
                        "Apple",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 10,
                        top: 50,
                        child: Text(
                          "NEW AIRPODS 3 PRO",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        )),
                  ]),
                ),
              ),
              Container(
                height: 400,
                width: 400,
                color: Color(0xffFFFFFF),
                child: MouseRegion(
                  onEnter: (f) {
                    setState(() {
                      isHover = true;
                    });
                  },
                  onHover: (f) {
                    setState(() {
                      // mousepos += f.delta;
                      mousepos *= 0.12;
                    });
                  },
                  onExit: (f) {
                    setState(() {
                      isHover = false;
                    });
                  },
                  child: Stack(children: [
                    // Image.asset(
                    //   "images/pc.jpg",
                    //   height: 396,
                    // )
                    Image4(),
                    Positioned(
                        left: 24,
                        top: 20,
                        child: Text(
                          "Asus",
                          style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        )),
                    Positioned(
                        left: 20,
                        top: 50,
                        child: Text(
                          " Builded PC",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )),
                  ]),
                ),
              ),
            ],
          );
  }
}

//  return FittedBox(
//       fit: BoxFit.fill,
//       child: Container(
//         margin: EdgeInsets.only(left: 80, right: 80),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => productlist()));
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Color(0x80BDC6D9),
//                           offset: Offset(0, 1.5),
//                           blurRadius: 2,
//                           spreadRadius: 1)
//                     ]),
//                 height: 330,
//                 width: 600,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: FittedBox(
//                     fit: BoxFit.fill,
//                     child: Image.network(
//                         "https://images.unsplash.com/photo-1529961172671-d48e8280f846?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=827&q=80"),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 30,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: Color(0xffC5C5C5),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Color(0x80BDC6D9),
//                         offset: Offset(0, 1.5),
//                         blurRadius: 2,
//                         spreadRadius: 1)
//                   ]),
//               height: 330,
//               width: 600,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: FittedBox(
//                   fit: BoxFit.fill,
//                   child: Image.network(
//                       "https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1032&q=80"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

Image1() {
  return AnimatedPositioned(
    curve: Curves.easeInOut,
    height: isHover ? 400 : 496,
    duration: Duration(milliseconds: 1000),
    child: Center(
      child: Image.asset(
        "images/monitor.png",
        height: 356,
        width: 356,
      ),
    ),
  );
}

Image2() {
  return AnimatedPositioned(
    curve: Curves.easeInOut,
    height: isHover ? 500 : 450,
    duration: Duration(milliseconds: 1000),
    child: Image.asset("images/airpod3.png"),
  );
}

Image3() {
  return AnimatedPositioned(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      height: isHover ? 256 : 210,
      child: Image.asset(
        "images/wireless-banner.jpg",
        fit: BoxFit.contain,
      ));
}

Image4() {
  return AnimatedPositioned(
      duration: Duration(milliseconds: 1000),
      height: isHover ? 456 : 396,
      curve: Curves.easeInOut,
      child: Image.asset(
        "images/pc1.jpg",
        height: 396,
      ));
}
