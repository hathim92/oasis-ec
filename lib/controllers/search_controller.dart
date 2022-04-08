import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oasis/Services/api_service.dart';

class SearchController extends GetxController {
  var searchDetails;
  var searchProducts = [].obs;
  var forShow = [].obs;

  @override
  void onInit() {
    //fetchDetails();
    // fetchingProductDetails(Get.arguments);
    super.onInit();
  }

  Future<void> fetchDetails() async {
    searchDetails = (await ApiServices().getProductDetails("dfs"));
    searchProducts.value = searchDetails['search'];
    forShow.value = searchProducts;
    // specFilters.value =
    //     theDetails['specificationForFilter'][0]['specifications'];
    // isLoading.value = false;
  }
}
