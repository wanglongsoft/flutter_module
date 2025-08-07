import 'package:flutter/material.dart';
import '../../adapter/capture_screen_adapter.dart';
import '../../util/dialog_util.dart';
import '../../view/widget/remove_ripple_widget.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final bool safeBottom;

  const TextWidget({
    required this.text,
    this.safeBottom = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => DialogUtil.showCopyDialog(context, text),
      child: Padding(
        padding: EdgeInsets.only(left: 4.cw),
        child: RemoveRippleWidget(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: safeBottom ? MediaQuery.of(context).padding.bottom : 0,
            ),
            physics: const ClampingScrollPhysics(),
            child: SelectableText(
              text ?? '',
              style: TextStyle(
                fontSize: 12.csp,
                color: const Color(0xFF333333),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
