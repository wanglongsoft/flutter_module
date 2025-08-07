import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithEllipsisDetail extends StatelessWidget {
  final String data;
  final String ellipsis;
  final String detail;
  final VoidCallback onDetailTap;

  const TextWithEllipsisDetail({
    super.key,
    required this.data,
    this.ellipsis = "...",
    this.detail = "详情",
    required this.onDetailTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        DateTime start = DateTime.now();
        final textStyle = Theme.of(context).textTheme.bodyMedium!;

        final fullText = '$data$ellipsis$detail';
        final detailText = '$data$ellipsis';
        // 使用 TextPainter 计算哪些字符可以显示
        final span = TextSpan(text: fullText, style: textStyle);
        final tp = TextPainter(
          text: span,
          maxLines: 2,
          textDirection: TextDirection.ltr,
        );
        tp.layout(maxWidth: constraints.maxWidth);
        debugPrint("fullText: ${fullText.length}");
        debugPrint("new fullText time: ${DateTime.now().difference(start)}");
        // 判断是否需要截断
        if (!tp.didExceedMaxLines) {
          // 不截断，正常显示所有文字 + 查看详情
          return RichText(
            text: TextSpan(
              text: detailText,
              style: textStyle,
              children: [
                TextSpan(
                  text: detail,
                  style: textStyle.copyWith(color: Colors.blue),
                  recognizer: TapGestureRecognizer()..onTap = onDetailTap,
                ),
              ],
            ),
          );
        }

        // 截断时，顺序查找法找出能容纳的最大字符数量
        // int end = fullText.length;

        // while (end > 0) {
        //   final currentSpan = TextSpan(
        //     text:
        //         title.substring(0, title.length - (fullText.length - end)) +
        //         ellipsis +
        //         detail,
        //     style: textStyle,
        //   );
        //   final currentTp = TextPainter(
        //     text: currentSpan,
        //     maxLines: 2,
        //     textDirection: TextDirection.ltr,
        //   );
        //   currentTp.layout(maxWidth: constraints.maxWidth);
        //
        //   if (!currentTp.didExceedMaxLines) {
        //     break;
        //   }
        //   // end = end ~/ 2;
        //   end--;
        // }

        // 截断时，二分法找出能容纳的最大字符数量
        int low = 0;
        int high = fullText.length;
        int end = 0;

        while (low <= high) {
          int mid = (low + high) ~/ 2;

          final currentSpan = TextSpan(
            text:
                data.substring(0, data.length - (fullText.length - mid)) +
                ellipsis +
                detail,
            style: textStyle,
          );

          final currentTp = TextPainter(
            text: currentSpan,
            maxLines: 2,
            textDirection: TextDirection.ltr,
          );
          currentTp.layout(maxWidth: constraints.maxWidth);

          if (!currentTp.didExceedMaxLines) {
            end = mid; // 可用，尝试更长
            low = mid + 1;
          } else {
            high = mid - 1; // 太长，缩短
          }
        }

        return RichText(
          maxLines: 2,
          overflow: TextOverflow.clip,
          text: TextSpan(
            text:
                data.substring(0, data.length - (fullText.length - end)) +
                ellipsis,
            style: textStyle,
            children: [
              TextSpan(
                text: detail,
                style: textStyle.copyWith(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = onDetailTap,
              ),
            ],
          ),
        );
      },
    );
  }
}
