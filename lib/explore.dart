import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oasis/constants.dart';
import 'package:oasis/models/feature_Model.dart';

import 'package:oasis/models/menu_model.dart';
import 'package:oasis/pages/detailpage.dart';
import 'package:oasis/pages/productgrid.dart';

import 'pages/textform.dart';

class explore extends StatefulWidget {
  const explore({
    Key? key,
  }) : super(key: key);

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 80, right: 80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 100.0,
                  child: ScrollConfiguration(
                    behavior:
                        ScrollConfiguration.of(context).copyWith(dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                    }),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: menudata.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: FittedBox(
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              // height: 10,
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // color: Colors.white,
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       // color: Colors.grey,
                                      //       offset: Offset(1, 0.5),
                                      //       spreadRadius: 1,
                                      //       blurRadius: 1)
                                      // ]
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: GestureDetector(
                                            child: Image.network(
                                              menudata[index].Image,
                                              fit: BoxFit.cover,
                                            ),
                                            onTap: () {
                                              print("${menudata[index].Name}");
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             allproduct(
                                              //                 categoryId:
                                              //                     menudata[
                                              //                         index])));
                                            })),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Center(
                                    child: Text(
                                      menudata[index].Name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: bigfamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
