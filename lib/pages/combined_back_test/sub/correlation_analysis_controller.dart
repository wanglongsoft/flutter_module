import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CorrelationAnalysisController extends GetxController {

  var title = "相关性分析.....";
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
