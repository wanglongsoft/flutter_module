import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BackTestResultController extends GetxController {

  var title = "回测结果.....";
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
