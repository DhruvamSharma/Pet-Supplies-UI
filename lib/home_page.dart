import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petsupplies/common_colors.dart';
import 'package:petsupplies/common_dimens.dart';
import 'package:petsupplies/favourite_listing.dart';
import 'package:petsupplies/supply_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final AnimationController controller;

  HomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(controller.value * 200, 0),
        child: Transform.scale(
          scale: 1 - (0.3 * controller.value),
          child: child,
        ),
      ),
      child: buildAnimatedChild(context),
    );
  }

  buildAnimatedChild(BuildContext context) {
    return ChangeNotifierProvider<SupplyProviderModel>(
      create: (_) => SupplyProviderModel(),
      child: Builder(
        builder: (providerContext) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).padding.top,
                  width: MediaQuery.of(context).size.width,
                  color: CommonColors.primaryColorDark,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: CommonDimens.statusBarTopPadding,
                    left: CommonDimens.leftRightPadding,
                    right: CommonDimens.leftRightPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.widgets,
                          color: CommonColors.accentColor,
                        ),
                        onPressed: () {
                          if (controller.isCompleted) {
                            controller.reverse();
                          } else {
                            controller.forward();
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FlutterIcons.shopping_bag_fea,
                          color: CommonColors.accentColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SupplyList(),
                FavouriteProductListing(),
              ],
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}

class SupplyProviderModel extends ChangeNotifier {
  int selectedIndex = 0;

  void assignIndex(int newIndex) {
    if (selectedIndex != newIndex) {
      selectedIndex = newIndex;
      notifyListeners();
    }
  }
}
