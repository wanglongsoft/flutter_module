import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'earning_performance_controller.dart';

class EarningPerformance extends GetView<EarningPerformanceController> {
  const EarningPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controller.title, style: TextStyle(color: Colors.redAccent),),
      ],
    );
  }
}