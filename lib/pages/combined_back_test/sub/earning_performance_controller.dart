import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EarningPerformanceController extends GetxController {

  var title = "收益表现.....";
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
