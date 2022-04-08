import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oasis/Services/api_service.dart';
import 'package:oasis/models/service_center_model.dart';

class ServiceController extends GetxController {
  var serviceDetails;
  var serviceCenters = <servicesDataServiceCenters>[].obs;
  var brandList = [].obs;
  var initialBrand = 'Select Brand'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDetails();
    fetchBrandList();
  }

  void fetchDetails() async {
    serviceDetails = (await ApiServices().getServiceCenterData());
    serviceCenters.value = serviceDetails.data.serviceCenters;
    print(serviceCenters.value);
    // for (var i = 0; i < brandList.length; i++) {
    //   brandListForDropDown.add(brandList[i].name);
    // }
    // initialBrandValue.value = brandListForDropDown[0];
  }

  void fetchBrandList() async {
    var response = (await ApiServices().getBrandList());
    brandList.value = response['data']['brands'];
    brandList.insert(0, initialBrand.value);
    initialBrand.value = brandList.first;
    print("brandLists ${brandList.value}");
  }

  void fetchServiceCenterByBranch() async {
    serviceDetails =
        (await ApiServices().getServiceCenterByBrands(initialBrand.value));
    serviceCenters.value = serviceDetails.data.serviceCenters;
  }
}
