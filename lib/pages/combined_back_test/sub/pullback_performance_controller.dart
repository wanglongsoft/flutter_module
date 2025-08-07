import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PullbackPerformanceController extends GetxController {
  var title = "回撤表现.....";
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
