import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'correlation_analysis_controller.dart';

class CorrelationAnalysis extends GetView<CorrelationAnalysisController> {
  const CorrelationAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controller.title, style: TextStyle(color: Colors.redAccent),),
      ],
    );
  }
}
