import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oasis/models/services_model.dart';
import 'package:oasis/pages/detailpage.dart';
import 'package:oasis/pages/filterpage.dart';
import 'package:oasis/pages/productgrid.dart';
import 'package:oasis/pages/service_center.dart';
import 'package:oasis/sliver.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'homepage.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Oasis",
      initialRoute: '/',
      defaultTransition: Transition.upToDown,
      routes: {
        '/': (context) => const homepage(),
        '/allproduct': (context) => allproduct(),
        '/productdetails': (context) => detail(),
        '/service-center': (context) => const Servicecenter(),
      },

      theme: ThemeData(
        //primaryColor: Colors.white,
        fontFamily: 'Poppins',
      ).copyWith(dividerColor: Colors.transparent),
      //home: homepage(),
    );
  }
}
