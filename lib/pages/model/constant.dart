// 题材星 竞价星 技术星 情绪星 趋势星列表使用
import 'package:flutter_module/pages/model/table_model.dart';

List<TableModel> tableColumns = [
  TableModel(
    title: "股票名称",
    width: 200,
    isSort: false,
    paddingRight: 0,
  ), // stockTitleView
  TableModel(
    title: "开幅",
    width: 160,
    isColorChange: true,
    sortKey: "open_rate",
  ), // stockRateView
  TableModel(
    title: "涨幅",
    width: 160,
    isColorChange: true,
    sortKey: "rate",
  ), // stockRateView
  TableModel(
    title: "星级",
    width: 230,
    paddingRight: 20,
    isSort: false,
  ), // stockStarView
  TableModel(
    title: "概念板块",
    width: 180,
    isSort: false,
    paddingRight: 30,
  ), // stockTextView
  TableModel(
    title: "入选时间",
    width: 192,
    paddingRight: 30,
    sortKey: "creat_time",
  ), // stockTimeView
  TableModel(
    title: "最新",
    width: 180,
    sortKey: "last_price",
  ), // stockPriceView
  TableModel(
    title: "5日涨幅",
    width: 200,
    isColorChange: true,
    sortKey: "rate5",
  ), //  stockRateView
  TableModel(
    title: "10日涨幅",
    width: 200,
    isColorChange: true,
    sortKey: "rate10",
  ), // stockRateView
  TableModel(
    title: "流通市值",
    width: 200,
    sortKey: "ltsz",
  ), // stockTextView
  TableModel(
    title: "总股本",
    width: 200,
    sortKey: "zgb",
  ), // stockTextView
  TableModel(
    title: "总市值",
    width: 200,
    sortKey: "zsz",
  ), // stockTextView
  TableModel(
    title: "加自选",
    width: 140,
    isSort: false,
    paddingRight: 24,
  ),
];