

class BannerItemModel {
  String? href;
  String? picUrl;
  BannerItemModel({this.href, this.picUrl});
  BannerItemModel.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?,
        picUrl = json['pic_url'] as String?;
}


class BannerListModel {
  List<BannerItemModel> items;
  BannerListModel({required this.items});
  factory BannerListModel.fromJson(dynamic json) {
    List list = (json as List).map((i) {
      return BannerItemModel.fromJson(i);
    }).toList();
    return BannerListModel(items: list as List<BannerItemModel>);
  }
}

