import 'package:flutter/material.dart';
import 'package:flutter_cart/widgets/index.dart';
import 'package:flutter_cart/model.dart';
import '../../data/category.dart';
import 'package:flutter_cart/utils/screen_util.dart';
class Category extends StatefulWidget {
  final double rightListViewHeight;
  Category({Key? key, this.rightListViewHeight = 0}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<Category> {
  int currentPage = 0;
  GlobalKey<RightListViewState> rightListviewKey =
      new GlobalKey<RightListViewState>();
  GlobalKey<CategoryMenueState> categoryMenueKey =
      new GlobalKey<CategoryMenueState>();
  List<SubCategoryListModel> listViewData = [];
  bool isAnimating = false;
  int itemCount = 0;
  double menueWidt = 0;
  double itemHeight = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFFFFFFF),
        child: Column(
          children: <Widget>[
          Text(" SearchBar()"),
            Expanded(
              child: Row(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      color: Color(0xFFf7f7f7),
                      width:  ScreenUtil().L(75),
                      child: CategoryMenue(
                          key: categoryMenueKey,
                          items: categoryData.map((i){
                            return i['name'] as String;
                          }).toList(),
                          itemHeight: ScreenUtil().L(44),
                          itemWidth: ScreenUtil().L(75),
                          menueTaped: menueItemTap),
                    ),
                  ),
                  RightListView(
                      key: rightListviewKey,
                      height: widget.rightListViewHeight,
                      dataItems: listViewData,
                      listViewChanged: listViewChanged)
                ],
              ),
            )
          ],
        ));
  }

  menueItemTap(int i) {
  
    rightListviewKey.currentState!.jumpTopage(i);
  }

  
  listViewChanged(i) {
  
    this.categoryMenueKey.currentState!.moveToTap(i);
  }
@override
  void reassemble() {
    listViewData = categoryData.map((i){
      return SubCategoryListModel.fromJson(i);
    }).toList();
    super.reassemble();
  }
  @override
  void initState() {
  
    listViewData = categoryData.map((i){
      return SubCategoryListModel.fromJson(i);
    }).toList();
    super.initState();
  }
}
