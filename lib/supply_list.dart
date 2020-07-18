import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petsupplies/common_colors.dart';
import 'package:petsupplies/common_dimens.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class SupplyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 100, end: 0),
      duration: Duration(
        milliseconds: 200,
      ),
      builder: (_, double progress, Widget child) {
        return Transform.translate(
          offset: Offset(0, progress),
          child: child,
        );
      },
      child: Container(
        height: 130,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: CommonDimens.leftRightPadding,
              ),
              child: GestureDetector(
                onTap: () {
                  Provider.of<SupplyProviderModel>(context, listen: false)
                      .assignIndex(index);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    border: Provider.of<SupplyProviderModel>(context)
                                .selectedIndex !=
                            index
                        ? Border.all(color: CommonColors.accentColor)
                        : null,
                    shape: BoxShape.circle,
                    boxShadow: Provider.of<SupplyProviderModel>(context)
                                .selectedIndex ==
                            index
                        ? [
                            BoxShadow(
                                color: Colors.orange[200],
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                                offset: Offset(0.0, 3.0))
                          ]
                        : null,
                  ),
                  child: CircleAvatar(
                    backgroundColor: CommonColors.iconColor,
                    radius: Provider.of<SupplyProviderModel>(context)
                                .selectedIndex ==
                            index
                        ? 40
                        : 30,
                    child: Icon(
                      iconList[index],
                      color: CommonColors.accentColor,
                    ),
                  ),
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: iconList.length,
        ),
      ),
    );
  }

  List<IconData> iconList = [
    FlutterIcons.bone_mco,
    FlutterIcons.paw_mco,
    FlutterIcons.ribbon_mco,
    FlutterIcons.food_apple_mco,
  ];
}
