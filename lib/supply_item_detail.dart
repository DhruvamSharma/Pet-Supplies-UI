import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petsupplies/common_colors.dart';
import 'package:petsupplies/core/constants.dart';
import 'package:petsupplies/favourite_list.dart';
import 'common_dimens.dart';

class SupplyItemDetailRoute extends StatelessWidget {
  static const String routeName =
      "${appName}_${versionName}_${itemDetailModule}_item-detail";
  final int index;

  SupplyItemDetailRoute(this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: favouriteItemList[index].color,
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Hero(
                  tag: favouriteItemList[index].itemImage,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 10,
                    margin: const EdgeInsets.all(0),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          CommonDimens.leftRightPadding,
                        ),
                      ),
                    ),
                    child: ClipRRect(
                      child: Container(
                        color: favouriteItemList[index].color,
                        margin: const EdgeInsets.all(0),
                        child: Image.network(
                          favouriteItemList[index].itemImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 200, end: 0),
                duration: Duration(
                  milliseconds: 300,
                ),
                builder: (_, double progress, Widget child) {
                  return Transform.translate(
                    offset: Offset(0, progress),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.leftRightPadding,
                    vertical: CommonDimens.leftRightPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        favouriteItemList[index].itemName,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.w500,
                              color: CommonColors.headlineTextColor,
                            ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: CommonColors.accentColor.withOpacity(0.3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          "\$ ${favouriteItemList[index].itemPrice}",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.w500,
                                color: CommonColors.headlineTextColor,
                              ),
                        ),
                      )
                    ],
                  ),
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
