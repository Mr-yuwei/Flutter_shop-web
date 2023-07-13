

class SubCategoryItemModel {
  String? name;
  String? icon;
  int? ucid ;
  SubCategoryItemModel({required this.name,required  this.icon, required this.ucid});
  SubCategoryItemModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        icon = json['icon'] as String?,
        ucid = json['ucid'] as int?;
}

class SubCategoryListModel {
  List<SubCategoryItemModel> list;
  String banner;
  SubCategoryListModel({required this.list,required this.banner});
  factory SubCategoryListModel.fromJson(dynamic json) {
    var items = json['list'] as List;
    var itemModals = items.map((item) {
      return SubCategoryItemModel.fromJson(item);
    }).toList();
    return SubCategoryListModel(list: itemModals,banner:json['banner']);
  }
}