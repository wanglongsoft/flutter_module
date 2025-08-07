import 'package:flutter_module/pages/combined_back_test/sub/back_test_result_controller.dart';
import 'package:flutter_module/pages/combined_back_test/sub/combined_diagnosis_controller.dart';
import 'package:flutter_module/pages/combined_back_test/sub/correlation_analysis_controller.dart';
import 'package:flutter_module/pages/combined_back_test/sub/earning_performance_controller.dart';
import 'package:flutter_module/pages/combined_back_test/sub/profit_probability_controller.dart';
import 'package:flutter_module/pages/combined_back_test/sub/pullback_performance_controller.dart';
import 'package:get/get.dart';
import 'controller.dart';

class PortfolioBackTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CombinedBackTestController());
    Get.lazyPut(() => BackTestResultController());
    Get.lazyPut(() => EarningPerformanceController());
    Get.lazyPut(() => PullbackPerformanceController());
    Get.lazyPut(() => ProfitProbabilityController());
    Get.lazyPut(() => CombinedDiagnosisController());
    Get.lazyPut(() => CorrelationAnalysisController());
  }
}
