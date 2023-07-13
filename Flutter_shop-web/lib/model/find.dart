class PinWeiGoodsModel {
  String name;
  String picUrl;
  double price;
  PinWeiGoodsModel({ required this.name, required this.picUrl,required this.price});
  PinWeiGoodsModel.fromJson(dynamic json)
      : picUrl = json['pic_url'],
        price = (json['price_min'] as int) / 100,
        name = json['name'];
}

class PinweiHomeBigArticleModel {
  List<PinWeiGoodsModel> goodsList;
  String? title;
  String? picUrl;
  PinweiHomeBigArticleModel({ required this.goodsList, this.title, this.picUrl});
  factory PinweiHomeBigArticleModel.fromJson(dynamic json) {
    List<PinWeiGoodsModel> items = [];
    if (json['goods_list'] != null) {
      items = (json['goods_list'] as List).map((i) {
        return PinWeiGoodsModel.fromJson(i as dynamic);
      }).toList();
    }
    return PinweiHomeBigArticleModel(
        goodsList: (items as  List<PinWeiGoodsModel>), title: json['title']  as String?, picUrl: json['pic_url'] as String?);
  }
}

class PinWeiHomeArticleCoverModel {
  String? picurl;
  String? title;
  String? subtitle;
  PinWeiHomeArticleCoverModel({ this.picurl, this.title, this.subtitle});
  PinWeiHomeArticleCoverModel.fromJson(dynamic json)
      : picurl = json['pic_url'] as String?,
        title = json['title'] as String? ,
        subtitle = json['subtitle'] as String?;
}

class PinWeiFloorTitleModel {
  String? title;
  String? url;
  PinWeiFloorTitleModel({required this.title,required this.url});
  PinWeiFloorTitleModel.fromJson(dynamic json)
      : title = json['title'] as String?,
        url = json['url'] as String?;
}
