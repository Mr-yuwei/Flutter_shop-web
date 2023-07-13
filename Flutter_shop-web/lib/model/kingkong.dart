class KingKongItem {
  String? href;
  String? picUrl;
  String? title;
  KingKongItem({required this.href,required this.picUrl,required this.title});
  KingKongItem.fromJson(Map<String, dynamic> json)
      : href = json['href'] as String?,
        title=json['title'] as String?,
        picUrl = json['pic_url'] as String?;
}

class KingKongList {
  List<KingKongItem> items;
  KingKongList({ required this.items});
  factory KingKongList.fromJson( dynamic json) {
    List list = (json as List).map((i) {
      return KingKongItem.fromJson(i);
    }).toList();
    return KingKongList(items: list as List<KingKongItem>);
  }
}