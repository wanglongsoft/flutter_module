import 'package:flutter/cupertino.dart';
import 'package:flutter_module/pages/combined_back_test/sub/back_test_result.dart';
import 'package:flutter_module/pages/combined_back_test/sub/combined_diagnosis.dart';
import 'package:flutter_module/pages/combined_back_test/sub/correlation_analysis.dart';
import 'package:flutter_module/pages/combined_back_test/sub/earning_performance.dart';
import 'package:flutter_module/pages/combined_back_test/sub/profit_probability.dart';
import 'package:flutter_module/pages/combined_back_test/sub/pullback_performance.dart';
import 'package:get/get.dart';

class CombinedBackTestController extends GetxController {
  final List tabs = ["回测结果", "收益表现", "回撤表现", "盈利概率", "组合诊断", "相关性分析"];
  final List tabsWidget = [
    BackTestResult(),
    EarningPerformance(),
    PullbackPerformance(),
    ProfitProbability(),
    CombinedDiagnosis(),
    CorrelationAnalysis(),
  ];
  @override
  void onInit() {
    super.onInit();
    debugPrint("onInit............");
  }

  void goToModifyBackTestScreen() {
    Get.back();
  }

  @override
  void onClose() {
    debugPrint("onClose............");
    super.onClose();
  }
}
