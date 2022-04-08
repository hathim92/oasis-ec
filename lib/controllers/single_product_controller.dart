import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:oasis/Services/api_service.dart';

class SingleProductController extends GetxController {
  var details = {}.obs;
  var indexValueOfImage = 0.obs;
  var imageArray = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchDetails(String id) async {
    //details.value = {};
    details.value = (await ApiServices().getSingleProductDetails(id));
    imageArray.value = [];
    for (var i = 0; i < details['images'].length; i++) {
      imageArray.add(details['images'][i]['image']['url']);
    }
    print('sdfdsf ${details}');
    print(details['images']);
    print('imageArray ${imageArray.value}');
  }
}
