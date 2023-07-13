import 'package:flutter_cart/scope_modal.dart';

class CartItemModel {
  String productName;
  int buyLimit;
  int count;
  String imageUrl;
  bool isSelected;
  bool isDeleted;
  num  price;
  CartItemModel(
      {required this.productName,
      required this.count,
      required this.buyLimit,
      required this.imageUrl,
     required  this.price,
      required this.isDeleted,
     required  this.isSelected});
  CartItemModel.fromJson(dynamic json)
      : productName = json['product_name'],
        buyLimit = json['buy_limit'],
        price = num.parse(json['market_price']),
        isDeleted = false,
        count = json['count'],
        isSelected = (json['select_status'] as int) == 1 ? true : false,
        imageUrl = json['image_url'];
}

class CartListModel extends Model {
  List<CartItemModel> items;

  CartListModel({required this.items});
  factory CartListModel.fromJson(dynamic json) {
    List<CartItemModel> list = (json as List).map((i) {
      return CartItemModel.fromJson((i));
    }).toList();
    return CartListModel(items: list);
  }
  get itemsCount {
    return this.items.length;
  }

  bool get isAllchecked {
    return items.every((i) => i.isSelected);
  }

  switchAllCheck() {
    if (this.isAllchecked) {
      items.forEach((i) => i.isSelected = false);
    } else {
      items.forEach((i) => i.isSelected = true);
    }
    notifyListeners();
  }

  double get sumTotal {
    double total = 0;
    items.forEach((item) {
      if (item.isDeleted == false && item.isSelected == true) {
        total = item.price * item.count + total;
      }
    });
    return total;
  }

  addCount(int index) {
    items[index].count = items[index].count + 1;
    notifyListeners();
  }

  downCount(int index) {
    items[index].count = items[index].count - 1;
    notifyListeners();
  }

  removeItem(index) {
    items.removeAt(index);
    notifyListeners();
  }

  switchSelect(i) {
    items[i].isSelected = !items[i].isSelected;
    notifyListeners();
  }

  get totalCount {
    int count = 0;
    items.forEach((item) {
      if (item.isDeleted == false && item.isSelected == true) {
        count = item.count + count;
      }
    });
    return count;
  }
}
