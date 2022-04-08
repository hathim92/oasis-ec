import 'package:flutter/material.dart';
import 'package:oasis/helpers/responsiveness.dart';

import 'homepage.dart';

class commonappbar extends StatelessWidget implements PreferredSizeWidget {
  const commonappbar({
    Key? key,
  }) : super(key: key);
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return (ResponsiveWidget.isMediumScreen(context) ||
            ResponsiveWidget.isLargeScreen(context))
        ? AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 50,
            // shadowColor: Colors.grey,

            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (ModalRoute.of(context)!.settings.name != "/") {
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => homepage()));
                          }
                        },
                        // child: Image.asset(
                        //   "images/oasis.png",
                        //   height: 40,
                        // ),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Container(
                        height: 35,
                        padding: EdgeInsets.only(
                          top: 8,
                          left: 8,
                        ),
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xffe2e2e2))),
                        child: Row(
                          children: [
                            // Text(
                            //   "All Category",
                            //   style: TextStyle(color: Colors.black),
                            // ),
                            // Icon(
                            //   Icons.arrow_drop_down,
                            //   color: Colors.black,
                            // ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: 35,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    // borderRadius:
                                    // BorderRadius.circular(20)
                                  ),
                                  // suffixIcon: Icon(
                                  //   Icons.search,
                                  //   size: 18,
                                  // ),
                                  hintText: 'Search',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            elevation: 4,
          )
        : AppBar(
            // leading: GestureDetector(
            //     onTap: () {
            //       if (ModalRoute.of(context)!.settings.name != "/") {
            //         Navigator.of(context).pop(
            //             MaterialPageRoute(builder: (context) => homepage()));
            //       }
            //     },
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Icon(Icons.menu),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //       ],
            //     )),
            backgroundColor: Colors.white,
            title: Row(
              children: [
                // Icon(Icons.menu),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (ModalRoute.of(context)!.settings.name != "/") {
                      Navigator.of(context).pop(
                          MaterialPageRoute(builder: (context) => homepage()));
                    }
                  },
                  child: Image.asset(
                    'images/oasis.png',
                    //width: 40,
                    height: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
  }
}
