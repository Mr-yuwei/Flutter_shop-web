class CrowdFundItemModel {
  String name;
  String summary;
  String picUrl;
  int marketPrice;
  int progress;
  int saledCount;
  String jumpUrl;
  CrowdFundItemModel(
      {required this.name,
      required this.marketPrice,
      required this.progress,
      required this.saledCount,
      required this.jumpUrl,
      required this.picUrl,
      required this.summary});
  factory CrowdFundItemModel.fromJson(dynamic json) {
    return CrowdFundItemModel(
        name: json['name'],
        summary: json['summary'],
        picUrl: json['pic_url'],
        marketPrice: json['market_price'],
        progress: json['progress'],
        saledCount: json['saled_count'],
        jumpUrl: json['jump_url']);
  }
}

class CrowdFundingListModel {
  List<CrowdFundItemModel> items;
  String title;

  CrowdFundingListModel({ required this.items, required this.title});
  factory CrowdFundingListModel.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    var items = itemsList.map((i) {
      return CrowdFundItemModel.fromJson(i);
    }).toList();

    return CrowdFundingListModel(items: items, title: json['title']);
  }
}
