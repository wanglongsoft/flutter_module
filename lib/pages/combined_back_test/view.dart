import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'fixed_width_indicator.dart';
import 'keep_alive_wrapper.dart';

class CombinedBackTest extends GetView<CombinedBackTestController> {
  const CombinedBackTest({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        appBar: AppBar(title: Text("组合回测")),
        body: Column(
          children: [
            Divider(color: Color(0xFFEEEEEE), height: 1.w),
            TabBar(
              labelColor: Color(0xFFEB3C3C),
              unselectedLabelColor: Color(0xFF2F2F2F),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              isScrollable: true,
              tabs:
              controller.tabs
                  .map((data) => Tab(text: data, height: 90.w))
                  .toList(),
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              dividerHeight: 1.w,
              dividerColor: Color(0xFFEEEEEE),
              indicator: FixedWidthIndicator(
                width: 40.w,
                height: 6.w,
                color: Color(0xFFEB3C3C),
              ),
              onTap: (index) {
                debugPrint("onTap: $index");
              },
            ),
            Expanded(
              child: TabBarView(
                // physics: NeverScrollableScrollPhysics(),
                children:
                controller.tabs.asMap().keys.map((index) {
                  return KeepAliveWrapper(
                    child: controller.tabsWidget[index],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
