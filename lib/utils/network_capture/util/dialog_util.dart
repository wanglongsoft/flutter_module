import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../util/toast_util.dart';
import '../adapter/capture_screen_adapter.dart';
import '../view/widget/remove_ripple_widget.dart';

class DialogUtil {
  ///显示对话框
  static Future<bool?> showCopyDialog(BuildContext context, String? message) {
    if (message == null || message.isEmpty) {
      return Future.value(false);
    }
    return showDialog<bool?>(
      context: context,
      builder: (_) {
        return AlertDialog(
          elevation: 0,
          title: const Center(child: Text('Content')),
          titleTextStyle: TextStyle(
            fontSize: 16.csp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
          titlePadding: EdgeInsets.only(top: 10.cw),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.cw,
            vertical: 10.cw,
          ),
          content: RemoveRippleWidget(
            child: SingleChildScrollView(
              child: Text(
                message,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 14.csp,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: const Color(0xFF666666),
                  fontSize: 14.csp,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: message));
                ToastUtil.showSnackBar(context, 'Copied!');
                Navigator.pop(context);
              },
              child: Text(
                'Copy',
                style: TextStyle(
                  color: const Color(0xFF666666),
                  fontSize: 14.csp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
