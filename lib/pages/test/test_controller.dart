import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_module/pages/model/constant.dart';
import 'package:flutter_module/pages/model/hz_model.dart';
import 'package:flutter_module/utils/dio_util.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class TestController extends GetxController {
  var count = "10".obs;

  final String title = "TestPage";
  late LinkedScrollControllerGroup _horizontalControllers;
  late ScrollController horizontalTitle;
  late ScrollController horizontalData;

  late LinkedScrollControllerGroup _verticalControllers;
  late ScrollController verticalTitle;
  late ScrollController verticalData;
  double screenWidth = 0;

  @override
  void onInit() {
    _horizontalControllers = LinkedScrollControllerGroup();
    horizontalTitle = _horizontalControllers.addAndGet();
    horizontalData = _horizontalControllers.addAndGet();

    _verticalControllers = LinkedScrollControllerGroup();
    verticalTitle = _verticalControllers.addAndGet();
    verticalData = _verticalControllers.addAndGet();
    screenWidth = getTableColumnsWidth();
    debugPrint("screenWidth............... $screenWidth");
    super.onInit();
  }

  @override
  void onClose() {
    debugPrint("onClose............");
    horizontalTitle.dispose();
    horizontalData.dispose();

    verticalTitle.dispose();
    verticalData.dispose();
    super.onClose();
  }

  double getTableColumnsWidth() {
    double width = 0;
    for (var value in tableColumns) {
      width += value.width;
    }
    return width;
  }
}
