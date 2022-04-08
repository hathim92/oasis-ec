import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oasis/Services/api_service.dart';
import 'package:oasis/models/home_page_model.dart';

class HomePageController extends GetxController {
  var homePageDetails;
  var brands = <Brands>[].obs;
  var newArrivals = <NewArrivals>[].obs;
  var topSellingProducts = <TopSellingProducts>[].obs;
  var bestSellingProducts = <IsBestSeller>[].obs;
  var featuredCategories = <FeaturedCategories>[].obs;
  var featuredProducts = <FeaturedProducts>[].obs;
  var categoryList = <Categories>[].obs;
  var showContainer = false.obs;
  var showSearchContainer = false.obs;
  Rx<Color> theFontColor = Color(0xff676767).obs;
  List hoverValue = [].obs;
  var isLoading = false.obs;
  var searchDetails;
  var searchValue = [].obs;
  var forShow = [].obs;
  var whatsappNumber = '919566306210'.obs;
  TextEditingController searchProducts = TextEditingController(text: '');
  var brandDetails = <NavBarBrandsData>[].obs;
  List brandStore = [
    [
      "Adata",
      "Memory Module",
      "Storage",
      "Pc Component",
      "Mouse & Keyboards",
      "View All"
    ],
    [
      "AMD",
      "Ryzen Threadripper",
      "Ryzen 9 Series",
      "Ryzen 7 Series",
      "Ryzen 5 Series",
      "View All"
    ],
    [
      "Adata",
      "Memory Module",
      "Storage",
      "Pc Component",
      "Mouse & Keyboards",
      "View All"
    ],
    [
      "AMD",
      "Ryzen Threadripper",
      "Ryzen 9 Series",
      "Ryzen 7 Series",
      "Ryzen 5 Series",
      "View All"
    ],
    [
      "Adata",
      "Memory Module",
      "Storage",
      "Pc Component",
      "Mouse & Keyboards",
      "View All"
    ],
    [
      "AMD",
      "Ryzen Threadripper",
      "Ryzen 9 Series",
      "Ryzen 7 Series",
      "Ryzen 5 Series",
      "View All"
    ],
    [
      "Adata",
      "Memory Module",
      "Storage",
      "Pc Component",
      "Mouse & Keyboards",
      "View All"
    ],
    [
      "AMD",
      "Ryzen Threadripper",
      "Ryzen 9 Series",
      "Ryzen 7 Series",
      "Ryzen 5 Series",
      "View All"
    ],
    [
      "Adata",
      "Memory Module",
      "Storage",
      "Pc Component",
      "Mouse & Keyboards",
      "View All"
    ],
    [
      "AMD",
      "Ryzen Threadripper",
      "Ryzen 9 Series",
      "Ryzen 7 Series",
      "Ryzen 5 Series",
      "View All"
    ],
    [
      "Adata",
      "Memory Module",
      "Storage",
      "Pc Component",
      "Mouse & Keyboards",
      "View All"
    ],
    [
      "AMD",
      "Ryzen Threadripper",
      "Ryzen 9 Series",
      "Ryzen 7 Series",
      "Ryzen 5 Series",
      "View All"
    ],
    [
      "Adata",
      "Memory Module",
      "Storage",
      "Pc Component",
      "Mouse & Keyboards",
      "View All"
    ],
    [
      "AMD",
      "Ryzen Threadripper",
      "Ryzen 9 Series",
      "Ryzen 7 Series",
      "Ryzen 5 Series",
      "View All"
    ],
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchDetails();
    fetchSearchDetails();

    super.onInit();
  }

  void fetchDetails() async {
    isLoading.value = true;
    homePageDetails = (await ApiServices().getData());
    newArrivals.value = homePageDetails.data.newArrivals;
    brands.value = homePageDetails.data.brands;
    topSellingProducts.value = homePageDetails.data.topSellingProducts;
    bestSellingProducts.value = homePageDetails.data.isBestSeller;
    featuredCategories.value = homePageDetails.data.featuredCategories;
    featuredProducts.value = homePageDetails.data.featuredProducts;
    categoryList.value = homePageDetails.data.categories;
    brandDetails.value = homePageDetails.data.navBarBrandsData;
    print(homePageDetails.data.navBarBrandsData);
    isLoading.value = false;
  }

  void fetchSearchDetails() async {
    //isLoading.value = true;
    searchDetails = (await ApiServices().fetchSearchDetails());
    searchValue.value = searchDetails['search'];
    forShow.value = searchValue;
    print("search value is ${searchValue}");
  }
}
