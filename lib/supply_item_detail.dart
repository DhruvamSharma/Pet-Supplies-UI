import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
        Container(
          height: MediaQuery.of(context).padding.top,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              )),
        ),
        Scaffold(
          body: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Hero(
                  tag: favouriteItemList[index].itemImage,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          CommonDimens.leftRightPadding * 2,
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
                  milliseconds: 400,
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
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 200, end: 0),
                duration: Duration(
                  milliseconds: 500,
                ),
                builder: (_, double progress, Widget child) {
                  return Transform.translate(
                    offset: Offset(0, progress),
                    child: child,
                  );
                },
                child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        left: CommonDimens.leftRightPadding,
                      ),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TweenAnimationBuilder(
                          tween: Tween<double>(begin: 200, end: 0),
                          duration: Duration(
                            milliseconds: 300 * (index + 2),
                          ),
                          builder: (_, double progress, Widget child) {
                            return Transform.translate(
                              offset: Offset(progress, 0),
                              child: child,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: index == 0
                                    ? 0
                                    : CommonDimens.leftRightPadding / 2),
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      CommonColors.progressBarBackgroundColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  CommonDimens.leftRightPadding / 4,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: CommonDimens.leftRightPadding / 2),
                                  child: Text(
                                    "In a matter of min",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(color: Colors.blueGrey),
                                  ),
                                ),
                                Text(
                                  "Never Before",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Colors.blueGrey,
                                      ),
                                ),
                                Spacer(),
                                Icon(
                                  FlutterIcons.lightbulb_on_mco,
                                  color: CommonColors.accentColor
                                      .withOpacity(0.39),
                                  size: 60,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                    )),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 200, end: 0),
                duration: Duration(
                  milliseconds: 500,
                ),
                builder: (_, double progress, Widget child) {
                  return Transform.translate(
                    offset: Offset(0, progress),
                    child: child,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: CommonDimens.leftRightPadding,
                    top: CommonDimens.leftRightPadding,
                    right: CommonDimens.leftRightPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: CommonDimens.leftRightPadding / 2,
                            right: CommonDimens.leftRightPadding),
                        child: Text(
                          "Decription",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.blueGrey),
                        ),
                      ),
                      Text(
                        "Out believe has request not how comfort evident. Up delight cousins we feeling minutes. Genius has looked end piqued spring.",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Colors.blueGrey, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 64,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
