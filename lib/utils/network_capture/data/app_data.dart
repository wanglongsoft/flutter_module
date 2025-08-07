class AppData {
  factory AppData() => _instance ?? AppData._internal();
  static AppData instance = _instance ?? AppData._internal();
  static AppData? _instance;
  late List<Map<String, Object?>> networkData;
  AppData._internal() {
    _instance = this;
    _instance!._init();
  }
  void _init() {
    networkData = [];
  }

  void insert(Map<String, Object?> map) {
    networkData.insert(0, map);
  }

  List<Map<String, Object?>> query() {
    return networkData;
  }

  void clear() {
    networkData.clear();
  }
}