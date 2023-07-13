import 'package:flutter/material.dart';
import 'package:flutter_cart/widgets/index.dart';
import 'package:flutter_cart/model.dart';
import 'package:flutter_cart/scope_modal.dart';
import 'package:flutter_cart/constants/color.dart';

class CartListWidget extends StatelessWidget {
  CartListModel? model;
  // BuildContext context;
  @override
  Widget build(BuildContext context) {
    // this.context = context;
    return ScopedModelDescendant<CartListModel>(
        builder: (context, child, model) {
      this.model = model;
      return Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: model.itemsCount,
          itemExtent: 93,
          itemBuilder: (BuildContext context, int index) {
            CartItemModel item = model.items[index];
            return Dismissible(
              resizeDuration: Duration(milliseconds: 100),
              key: Key(item.productName),
              onDismissed: (direction) {
                model.removeItem(index);
                // Scaffold.of(context).showSnackBar(SnackBar(
                //   content: Text("${item.productName}   成功移除"),
                //   backgroundColor: KColorConstant.themeColor,
                //   duration: Duration(seconds: 1),
                // ));
              },
              background: Container(color: KColorConstant.themeColor),
              child: CartItemWidget(model.items[index],
                  addCount: _addCount,
                  downCount: _downCount,
                  index: index,
                  switchChaned: _switchChanged),
            );
          },
        ),
      );
    });
  }

  _switchChanged(int i) {
    if (model!=null) {
      model!.switchSelect(i);
    } 
  }

  _addCount(int i) {
   if (model!=null) {
      model!.addCount(i);;
    } 
    
  }

  _downCount(int i) {
       if (model!=null) {
      model!.downCount(i);;
    } 
  }
}
