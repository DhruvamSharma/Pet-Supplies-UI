import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petsupplies/common_colors.dart';
import 'package:petsupplies/home_page.dart';
import 'package:petsupplies/main.dart';
import 'package:petsupplies/supply_item_detail.dart';
import 'package:provider/provider.dart';

import 'common_dimens.dart';

class FavouriteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: CommonDimens.leftRightPadding / 4),
      height: 280,
      child: ChangeNotifierProvider<SupplyItemProviderModel>(
        create: (_) => SupplyItemProviderModel(),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: CommonDimens.leftRightPadding,
                bottom: CommonDimens.leftRightPadding / 2,
              ),
              child: GestureDetector(
                onTap: () {
                  Provider.of<SupplyItemProviderModel>(context, listen: false)
                      .assignSelectedItem(index);
                  Navigator.pushNamed(context, SupplyItemDetailRoute.routeName,
                      arguments: favouriteItemList[index]);
                },
                child: SizedBox(
                  width: 200,
                  child: Hero(
                    tag: favouriteItemList[index].itemImage,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Card(
                          margin: const EdgeInsets.all(0),
                          clipBehavior: Clip.antiAlias,
                          elevation:
                              Provider.of<SupplyItemProviderModel>(context)
                                          .selectedItem ==
                                      index
                                  ? 8
                                  : 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                CommonDimens.leftRightPadding,
                              ),
                              bottomLeft: Radius.circular(
                                CommonDimens.leftRightPadding / 10,
                              ),
                              topLeft: Radius.circular(
                                CommonDimens.leftRightPadding / 10,
                              ),
                              topRight: Radius.circular(
                                CommonDimens.leftRightPadding / 10,
                              ),
                            ),
                          ),
                          child: Image.network(
                            favouriteItemList[index].itemImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: CommonDimens.leftRightPadding / 2,
                              bottom: CommonDimens.leftRightPadding / 2,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .addItemToCart(favouriteItemList[index]);
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Added to your cart"),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: CommonColors.accentColor,
                                  ));
                                },
                                child: CircleAvatar(
                                  radius: 16,
                                  child: Icon(
                                    FlutterIcons.add_mdi,
                                    color: CommonColors.accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: favouriteItemList.length,
        ),
      ),
    );
  }

  final favouriteItemList = [
    SupplyItemModel(
      itemImage:
          "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-6_250x.jpg?v=1588483432",
      itemName: "Comforters",
      itemPrice: 2132,
    ),
    SupplyItemModel(
      itemImage:
          "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-5_250x.jpg?v=1588483430",
      itemName: "Pet Food",
      itemPrice: 54324,
    ),
    SupplyItemModel(
      itemImage:
          "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-3_250x.jpg?v=1588483434",
      itemName: "Leashes",
      itemPrice: 2823,
    ),
    SupplyItemModel(
      itemImage:
          "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-2_250x.jpg?v=1588483433",
      itemName: "Clothes",
      itemPrice: 99722,
    ),
  ];
}

class SupplyItemModel {
  String itemImage;
  String itemName;
  double itemPrice;
  SupplyItemModel({
    @required this.itemImage,
    @required this.itemName,
    @required this.itemPrice,
  });
}

class SupplyItemProviderModel extends ChangeNotifier {
  int selectedItem = 0;
  void assignSelectedItem(int index) {
    selectedItem = index;
    notifyListeners();
  }
}
