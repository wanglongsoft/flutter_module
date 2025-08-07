import 'package:flutter/material.dart';
import 'package:flutter_module/pages/combined_back_test/sub/pullback_performance_controller.dart';
import 'package:get/get.dart';

class PullbackPerformance extends GetView<PullbackPerformanceController> {
  const PullbackPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controller.title, style: TextStyle(color: Colors.redAccent)),
      ],
    );
  }
}
