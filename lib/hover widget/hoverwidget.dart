import 'package:flutter/material.dart';

import '../constants.dart';

//Category widget
Widget Hovercat() => Container(
      padding: EdgeInsets.all(5),
      width: 1240,
      // height: 500,

      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.25),
          border: Border.all(
            color: Color.fromRGBO(31, 38, 135, 0.37),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(31, 38, 135, 0.37),
              blurRadius: 2,
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 430,
              child: GridView.count(
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(20, (index) {
                  return Container(
                    // margin: EdgeInsets.all(10),
                    // height: 100,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 2),
                              blurRadius: 2,
                              color: Color(0x80BDC6D9))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "AMD",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: smallfamily,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Ryzen Threadripper",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontFamily: smallfamily),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Ryzen 9 Series",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: smallfamily)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Ryzen 7 Series",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: smallfamily)),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Ryzen 5 Series",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: smallfamily)),
                          SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Text("View all…",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: smallfamily)),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
