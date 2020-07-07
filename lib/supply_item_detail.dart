import 'package:flutter/material.dart';
import 'package:petsupplies/common_colors.dart';
import 'package:petsupplies/core/constants.dart';
import 'package:petsupplies/favourite_list.dart';
import 'common_dimens.dart';

class SupplyItemDetailRoute extends StatelessWidget {
  static const String routeName =
      "${appName}_${versionName}_${itemDetailModule}_item-detail";
  final SupplyItemModel itemModel;

  SupplyItemDetailRoute(this.itemModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                width: MediaQuery.of(context).size.width,
                color: CommonColors.primaryColorDark,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Hero(
                  tag: itemModel.itemImage,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          CommonDimens.leftRightPadding * 3,
                        ),
                      ),
                    ),
                    child: Image.network(
                      itemModel.itemImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimens.leftRightPadding,
                  vertical: CommonDimens.leftRightPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemModel.itemName,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.w500,
                            color: CommonColors.headlineTextColor,
                          ),
                    ),
                    Text(
                      "\$ ${itemModel.itemPrice}",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w500,
                            color: CommonColors.headlineTextColor,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.dark,
        ),
      ],
    );
  }
}
