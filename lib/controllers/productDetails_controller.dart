// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oasis/Services/api_service.dart';

class ProductDetailsController extends GetxController {
  var productDetails = [].obs;
  var specFilters = [].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    //fetchDetails();
    // fetchingProductDetails(Get.arguments);
    super.onInit();
  }

  Future<void> fetchingProductDetails(String name) async {
    isLoading.value = true;
    productDetails.value = [];
    specFilters.value = [];
    var theDetails = (await ApiServices().getProductDetails(name));
    productDetails.value = theDetails['products'];
    if (theDetails['specificationForFilter'].length > 0) {
      specFilters.value =
          theDetails['specificationForFilter'][0]['specifications'];
    } else {
      specFilters.value = [];
    }

    isLoading.value = false;
  }

  Future<void> fetchingProductDetailsByBrand(String name) async {
    isLoading.value = true;
    productDetails.value = [];
    specFilters.value = [];
    var theDetails = (await ApiServices().getProductDetailsByBrand(name));
    productDetails.value = theDetails['products'];
    specFilters.value =
        theDetails['specificationForFilter'][0]['specifications'];
    isLoading.value = false;
  }

  Future<void> filteredProductDetails(Map filterMap) async {
    isLoading.value = true;
    productDetails.value = [];
    var theDetails = (await ApiServices().getFilteredProductDetails(filterMap));
    productDetails.value = theDetails['products'];
    print(productDetails.value);
    isLoading.value = false;
    specFilters.value =
        theDetails['specificationForFilter'][0]['specifications'];
    print(specFilters.value);
  }

  Future<void> fetchingProductDetailsBySearch(String name) async {
    isLoading.value = true;
    productDetails.value = [];
    specFilters.value = [];
    var theDetails = (await ApiServices().getProductDetailsBySearch(name));
    productDetails.value = theDetails['products'];
    specFilters.value =
        theDetails['specificationForFilter'][0]['specifications'];
    isLoading.value = false;
  }
}
