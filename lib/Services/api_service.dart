import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oasis/constants/strings.dart';
import 'package:oasis/models/home_page_model.dart';
import 'package:oasis/models/service_center_model.dart';
import 'package:oasis/pages/show_snackbar.dart';

class ApiServices {
  Future<HomePageDetails> getData() async {
    var homePageDetails;
    var url = Uri.parse(Strings.main_url);
    //var url = Uri.parse('http://173.212.206.147:4000/');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var reqValue = json.decode(response.body);
        homePageDetails = HomePageDetails.fromJson(reqValue);
      }
    } catch (e) {
      print(e);
    }
    return homePageDetails;
  }

  Future getProductDetails(String id) async {
    var productDetails;
    print("The Category value is $id");
    var url = Uri.parse(Strings.main_url +
        'products/categories/' +
        id); //+ Strings.get_all_products_method);
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        productDetails = jsonValue['data'];
        // print(productDetails);
      }
    } catch (e) {
      print(e);
    }
    return productDetails;
  }

  Future getProductDetailsByBrand(String name) async {
    var productDetails;
    print("The Category value is $name");
    var url = Uri.parse(Strings.main_url +
        'products/brands/' +
        name); //+ Strings.get_all_products_method);
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        productDetails = jsonValue['data'];
        // print(productDetails);
      }
    } catch (e) {
      print(e);
    }
    return productDetails;
  }

  Future getProductDetailsBySearch(String name) async {
    var productDetails;
    print("The Category value is $name");
    var url = Uri.parse(Strings.main_url +
        Strings.get_products_by_search +
        name); //+ Strings.get_all_products_method);
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        productDetails = jsonValue['data'];
        // print(productDetails);
      }
    } catch (e) {
      print(e);
    }
    return productDetails;
  }

  Future getFilteredProductDetails(Map filterMap) async {
    var productDetails;
    print("The filterMap value is $filterMap");
    var urlToken = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(
      Strings.main_url + 'products/filter',
    ); //+ Strings.get_all_products_method);
    try {
      var response =
          await http.post(url, headers: urlToken, body: jsonEncode(filterMap));

      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        productDetails = jsonValue['data'];
        // print(productDetails);
      }
    } catch (e) {
      print(e);
    }
    return productDetails;
  }

  Future getSingleProductDetails(String id) async {
    var productDetails;
    print("The Category value is $id");
    var url = Uri.parse(Strings.main_url +
        Strings.get_individual_product_details +
        '/' +
        id); //+ Strings.get_all_products_method);
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        productDetails = jsonValue['data'];
        print("asdfghg ${productDetails['specifications']}");
      }
    } catch (e) {
      print(e);
    }
    return productDetails;
  }

  Future<dynamic> getServiceCenterData() async {
    var serviceData;
    var url = Uri.parse(Strings.main_url + Strings.get_all_services);
    var map = {
      "isAdminPanel": false,
    };
    var urlToken = {
      'Content-Type': 'application/json',
      // 'Authorization': 'bearer ' + _loginController.token.value
    };
    try {
      var response =
          await http.post(url, headers: urlToken, body: jsonEncode(map));

      if (response.statusCode == 200) {
        var reqValue = json.decode(response.body);
        serviceData = Services.fromJson(reqValue);
        print("The response is ${reqValue}");
      } else {
        print("The error response is ${json.decode(response.body)['message']}");
        ShowSnackbar().showAlert('Alert', json.decode(response.body)['message'],
            Icons.alarm, Colors.blue);
      }
    } catch (e) {
      print("error $e");
      ShowSnackbar().showAlert(
          'Error',
          "Something went Wrong, Please Contact Administrator!..",
          Icons.error,
          Colors.black);
    }
    return serviceData;
  }

  Future<dynamic> getServiceCenterByBrands(brandId) async {
    var serviceData;
    var url = Uri.parse(Strings.main_url + Strings.get_service_center_by_brand);
    var map = {
      "brandId": brandId,
    };
    var urlToken = {
      'Content-Type': 'application/json',
      // 'Authorization': 'bearer ' + _loginController.token.value
    };
    try {
      var response =
          await http.post(url, headers: urlToken, body: jsonEncode(map));

      if (response.statusCode == 200) {
        var reqValue = json.decode(response.body);
        serviceData = Services.fromJson(reqValue);
        print("The response is ${reqValue}");
      } else {
        print("The error response is ${json.decode(response.body)['message']}");
        ShowSnackbar().showAlert('Alert', json.decode(response.body)['message'],
            Icons.alarm, Colors.blue);
      }
    } catch (e) {
      print("error $e");
      ShowSnackbar().showAlert(
          'Error',
          "Something went Wrong, Please Contact Administrator!..",
          Icons.error,
          Colors.black);
    }
    return serviceData;
  }

  Future<dynamic> getBrandList() async {
    var brandData;
    var url = Uri.parse(Strings.main_url + Strings.get_all_brand_list);

    var urlToken = {
      'Content-Type': 'application/json',
      // 'Authorization': 'bearer ' + _loginController.token.value
    };
    try {
      var response = await http.get(url, headers: urlToken);

      if (response.statusCode == 200) {
        brandData = json.decode(response.body);
        print("The response is ${brandData['data']['brands']}");
      } else {
        print("The error response is ${json.decode(response.body)['message']}");
        ShowSnackbar().showAlert('Alert', json.decode(response.body)['message'],
            Icons.alarm, Colors.blue);
      }
    } catch (e) {
      print("error $e");
      ShowSnackbar().showAlert(
          'Error',
          "Something went Wrong, Please Contact Administrator!..",
          Icons.error,
          Colors.black);
    }
    return brandData;
  }

  Future fetchSearchDetails() async {
    var productDetails;

    var url = Uri.parse(Strings.main_url +
        Strings.get_search_results); //+ Strings.get_all_products_method);
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        productDetails = jsonValue['data'];
        print("asdfghg ${productDetails}}");
      }
    } catch (e) {
      print(e);
    }
    return productDetails;
  }
}
