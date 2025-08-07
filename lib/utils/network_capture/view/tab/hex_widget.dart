import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../adapter/capture_screen_adapter.dart';
import '../../util/dialog_util.dart';
import '../../util/hex_util.dart';
import '../../view/widget/remove_ripple_widget.dart';

class HexWidget extends StatefulWidget {
  final String? text;
  final bool safeBottom;

  const HexWidget({
    required this.text,
    this.safeBottom = false,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HexWidgetState();
}

class _HexWidgetState extends State<HexWidget>
    with AutomaticKeepAliveClientMixin {
  List<HexResult>? _list;

  @override
  void initState() {
    super.initState();
    compute(_calcHex, widget.text).then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_list == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0XFFFF9900),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: 4.cw, right: 4.cw),
      child: RemoveRippleWidget(
        child: SelectionArea(
          child: ListView.separated(
            itemCount: _list!.length,
            separatorBuilder: (_, index) {
              return SizedBox(height: 2.cw);
            },
            padding: EdgeInsets.only(
              bottom:
                  widget.safeBottom ? MediaQuery.of(context).padding.bottom : 0,
            ),
            physics: const ClampingScrollPhysics(),
            itemBuilder: (_, index) {
              final e = _list![index];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(
                  children: [
                    GestureDetector(
                      onDoubleTap: () =>
                          DialogUtil.showCopyDialog(context, e.num),
                      child: Text(
                        e.num,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12.csp,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.cw),
                    GestureDetector(
                      onDoubleTap: () =>
                          DialogUtil.showCopyDialog(context, e.hex),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e.hex,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12.csp,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          Text(
                            '0' * (32 - e.hex.length),
                            style: TextStyle(
                              fontSize: 12.csp,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.cw),
                    GestureDetector(
                      onDoubleTap: () =>
                          DialogUtil.showCopyDialog(context, e.str),
                      child: Text(
                        e.str
                            .replaceAll('\n', '')
                            .replaceAll('\t', '  ')
                            .replaceAll('�', ' '),
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12.csp,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static List<HexResult> _calcHex(String? text) {
    final List<HexResult> result = [];
    const int length = 16;
    final list = utf8.encode(text ?? '');
    final line = (list.length / length).ceil();

    for (int i = 0; i < line; i++) {
      final start = i * length;
      final end = start + length;
      final str = list.sublist(start, end > list.length ? list.length : end);
      result.add(
        HexResult(
          start.toRadixString(16).padLeft(8, '0'),
          HexUtil.encode(str),
          utf8.decode(str, allowMalformed: true),
        ),
      );
    }
    return result;
  }

  @override
  bool get wantKeepAlive => true;
}

class HexResult {
  final String num;
  final String hex;
  final String str;

  HexResult(this.num, this.hex, this.str);
}
