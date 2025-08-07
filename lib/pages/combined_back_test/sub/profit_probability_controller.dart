import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfitProbabilityController extends GetxController {
  var title = "盈利概率.....";
  @override
  void onInit() {
    super.onInit();
    debugPrint("onInit............");
  }

  @override
  void onClose() {
    debugPrint("onClose............");
    super.onClose();
  }
}
