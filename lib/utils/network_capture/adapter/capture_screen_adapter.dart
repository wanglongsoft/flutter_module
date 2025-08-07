import 'package:flutter/cupertino.dart';

class CaptureScreenAdapter {
  factory CaptureScreenAdapter() => _getInstance();

  static CaptureScreenAdapter get instance => _getInstance();
  static CaptureScreenAdapter? _instance;

  static CaptureScreenAdapter _getInstance() {
    _instance ??= CaptureScreenAdapter._internal();
    return _instance!;
  }

  CaptureScreenAdapter._internal();

  double scaleWidth = 0;
  Size screen = Size.zero;

  void init(MediaQueryData data, Size designSize) {
    screen = data.size;
    scaleWidth = screen.width / designSize.width;
  }
}

extension NumExt on num {
  double get cw => this * CaptureScreenAdapter.instance.scaleWidth;

  double get csp => cw;
}
