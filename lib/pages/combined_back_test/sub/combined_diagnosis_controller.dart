import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CombinedDiagnosisController extends GetxController {

  var title = "组合诊断.....";
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
