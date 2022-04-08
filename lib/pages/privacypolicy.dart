import 'package:flutter/material.dart';
import 'package:oasis/commonappbar.dart';

import 'package:oasis/constants.dart';
import 'package:oasis/footer.dart';
import 'package:oasis/helpers/responsiveness.dart';
import 'package:oasis/homepage.dart';
import 'package:oasis/top_bar.dart';

class privaypolicy extends StatefulWidget {
  const privaypolicy({Key? key}) : super(key: key);

  @override
  State<privaypolicy> createState() => _privaypolicyState();
}

class _privaypolicyState extends State<privaypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: commonappbar(),
      body: (ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isLargeScreen(context))
          ? Stack(alignment: Alignment.topLeft, children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70, top: 100.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => homepage()));
                              });
                            },
                            icon: Icon(
                              Icons.home,
                              color: Colors.black,
                            )),
                        Text("/"),
                        Text(
                          "Privacy policies",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(80, 20, 80, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "We are committed to protecting your privacy. We will only use the information that we collect about you lawfully.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "We collect information about you for 2 reasons: firstly, to process your order and second, to provide you with the best possible service.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "We will give you the chance to refuse any marketing email from us.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "The type of information we will collect about you includes:",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            " Your Name , Address, Phone Number & Email Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "The information we hold will be accurate and up to date. You can check the information that we hold about you by emailing us. If you find any inaccuracies we will delete or correct it promptly.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "The personal information which we hold will be held securely in accordance with our internal security policy and the law.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "We may use technology to track the patterns of behavior of visitors to our site. This can include using a "
                            "cookie"
                            " which would be stored on your browser. You can usually modify your browser to prevent this happening.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "The information collected in this way can be used to identify you unless you modify your browser settings.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "If you have any questions/comments about privacy, you should contact us.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: smallfamily,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                  Expanded(child: footer())
                ],
              ),
              Container(
                height: 80.0,
                child: Material(
                  elevation: 0.0,
                  child: topbar(),
                ),
              ),
            ])
          : Stack(alignment: Alignment.topLeft, children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Text(
                          "Privacy policies",
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0),
                      child: Text(
                        "We are committed to protecting your privacy. We will only use the information that we collect about you lawfully.",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: smallfamily,
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "We collect information about you for 2 reasons: firstly, to process your order and second, to provide you with the best possible service.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "We will give you the chance to refuse any marketing email from us.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "The type of information we will collect about you includes:",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          " Your Name , Address, Phone Number & Email Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "The information we hold will be accurate and up to date. You can check the information that we hold about you by emailing us. If you find any inaccuracies we will delete or correct it promptly.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "The personal information which we hold will be held securely in accordance with our internal security policy and the law.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "We may use technology to track the patterns of behavior of visitors to our site. This can include using a "
                          "cookie"
                          " which would be stored on your browser. You can usually modify your browser to prevent this happening.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "The information collected in this way can be used to identify you unless you modify your browser settings.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "If you have any questions/comments about privacy, you should contact us.",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: smallfamily,
                              fontSize: 14)),
                    ),
                    footer()
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
            ]),
    );
  }
}
