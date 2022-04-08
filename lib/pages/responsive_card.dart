import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oasis/constants/responsive.dart';
import 'package:oasis/constants/strings.dart';
import 'package:oasis/constants/style.dart';

class responsivecard extends StatefulWidget {
  const responsivecard({Key? key}) : super(key: key);

  @override
  _responsivecardState createState() => _responsivecardState();
}

class _responsivecardState extends State<responsivecard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: const Mymobile(),
        tabbody: const Tabbody(),
        desktopBody: const desktopBody());
  }
}

class Mymobile extends StatefulWidget {
  const Mymobile({Key? key}) : super(key: key);

  @override
  _MymobileState createState() => _MymobileState();
}

class _MymobileState extends State<Mymobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height) / 2.1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: itemWidth / itemHeight,
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("object");
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
                                Image.asset(
                                  "images/camera.png",
                                  height: size.height / 4.5,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                    "AMD 3000 SERIES RYZEN 7 3800XT DESKTOP PROCESSOR 8 CORES 16 THREADS 36MB CACHE 3.9GHZ UPTO 4.7GHZ AM4 SOCKET 400 & 500 SERIES CHIPSET",
                                    maxLines: 3,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: mobileheading2, height: 1.4)),
                                Center(
                                  child: Text(
                                    "Processor",
                                    style: TextStyle(
                                        fontSize: mobilebody,
                                        color: Colors.grey),
                                  ),
                                ),
                                FittedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        "MRP 35,000",
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: mobilesubtext,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Rs 29,000",
                                        style: TextStyle(
                                          fontSize: mobilebody,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                            "Order Now",
                                            style: TextStyle(
                                                fontSize: mobilebody,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        height: 32,
                                        // width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            "Order Now",
                                            style: TextStyle(
                                                fontSize: mobilebody,
                                                color: Colors.white),
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
            )
          ],
        ),
      ),
    );
  }
}

class desktopBody extends StatefulWidget {
  const desktopBody({Key? key}) : super(key: key);

  @override
  _desktopBodyState createState() => _desktopBodyState();
}

bool ishover = false;

class _desktopBodyState extends State<desktopBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height) / 2.2;
    final double cardwidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: ishover ? size.height / 2 : itemHeight,
        // height: itemHeight,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }),
                child: GestureDetector(
                    onTap: () {
                      print("object");
                      print(size.width);
                    },
                    child: MouseRegion(
                      onEnter: (n) {
                        setState(() {
                          ishover = true;
                        });
                      },
                      onExit: (n) {
                        setState(() {
                          ishover = false;
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          print(ishover);
                        },
                        child: AnimatedContainer(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0.1),
                                color: ishover ? Colors.grey : Colors.white,
                                spreadRadius: 0,
                                blurRadius: 1)
                          ]),
                          duration: Duration(milliseconds: 200),
                          height: ishover ? itemHeight : size.height / 2,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 0, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "images/camera.png",
                                fit: BoxFit.fill,
                                height: ishover
                                    ? size.height / 3.5
                                    : size.height / 4,
                              ),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints(maxWidth: itemWidth / 3),
                                child: Text(
                                  "AMD 3000 SERIES RYZEN 7 3800XT DESKTOP PROCESSOR 8 CORES 16 THREADS 36MB CACHE 3.9GHZ UPTO 4.7GHZ AM4 SOCKET 400 & 500 SERIES CHIPSET",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.2,
                                      fontSize: desktopheading2 / 3,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Processor",
                                style: TextStyle(
                                    fontSize: desktopsubtext / 2,
                                    color: Colors.grey),
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "Rs 29,000",
                                      style: TextStyle(
                                        fontSize: desktopsubtext / 1.5,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "MRP 35,000",
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: desktopsubtext / 2,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    // height: 32,
                                    // width: 70,
                                    decoration:
                                        BoxDecoration(color: Colors.green),
                                    child: Center(
                                      child: Text(
                                        "Order Now",
                                        style: TextStyle(
                                            fontSize: desktoplinktext / 1.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    // height: 32,
                                    // width: 70,
                                    decoration:
                                        BoxDecoration(color: Colors.green),
                                    child: Center(
                                      child: Text(
                                        "Order Now",
                                        style: TextStyle(
                                            fontSize: desktoplinktext / 1.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              );
            }),
      ),
    );
  }
}

class Tabbody extends StatefulWidget {
  const Tabbody({Key? key}) : super(key: key);

  @override
  _TabbodyState createState() => _TabbodyState();
}

class _TabbodyState extends State<Tabbody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height) / 2.5;
    final double cardwidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: itemHeight,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            print("object");
                            print(size.width);
                          },
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(dragDevices: {
                              PointerDeviceKind.mouse,
                              PointerDeviceKind.touch,
                            }),
                            child: AnimatedContainer(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
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
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "images/image1.png",
                                    fit: BoxFit.fill,
                                    height: ishover
                                        ? size.height / 3.5
                                        : size.height / 5,
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxWidth: itemWidth / 2.5),
                                    child: Text(
                                      "AMD 3000 SERIES RYZEN 7 3800XT DESKTOP PROCESSOR 8 CORES 16 THREADS 36MB CACHE 3.9GHZ UPTO 4.7GHZ AM4 SOCKET 400 & 500 SERIES CHIPSET",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          height: 1.2,
                                          fontSize: tabheading2 / 1.5,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "Processor",
                                    style: TextStyle(
                                        fontSize: tabsubtext / 1.5,
                                        color: Colors.grey),
                                  ),
                                  FittedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Rs 29,000",
                                          style: TextStyle(
                                            fontSize: tabsubtext / 1.5,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "MRP 35,000",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: tabsubtext / 2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        // height: 32,
                                        // width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            "Order Now",
                                            style: TextStyle(
                                                fontSize: tablinktext,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        // height: 32,
                                        // width: 70,
                                        decoration:
                                            BoxDecoration(color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            "Order Now",
                                            style: TextStyle(
                                                fontSize: tablinktext,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
