class TableModel {
  final String title;// 标题
  final double width;// 宽度
  final double paddingRight;// 右间距
  final double paddingLeft;// 左间距，首列有用
  final bool isSort;// 是否有升序降序功能
  final String sortKey;// 排序的key
  final bool isColorChange;// 列数据是否颜色会变(大于等于0：红色，小于0：绿色)

  TableModel({
    required this.title,
    required this.width,
    this.paddingRight = 24,
    this.paddingLeft = 30,
    this.isSort = true,
    this.sortKey = "",
    this.isColorChange = false,
  });
}
