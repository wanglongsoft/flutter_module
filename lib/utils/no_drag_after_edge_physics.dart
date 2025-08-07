import 'package:flutter/material.dart';

class NoDragAfterEdgePhysics extends ScrollPhysics {
  const NoDragAfterEdgePhysics({super.parent});

  @override
  NoDragAfterEdgePhysics applyTo(ScrollPhysics? ancestor) {
    return NoDragAfterEdgePhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    // 正向滑动到最大边界
    if (value > position.maxScrollExtent) {
      return value - position.maxScrollExtent;
    }
    // 反向滑动到最小边界
    if (value < position.minScrollExtent) {
      return value - position.minScrollExtent;
    }
    return 0.0; // 正常滑动
  }
}
