import 'package:flutter/material.dart';
import 'package:petsupplies/home/cart_icon.dart';
import 'package:petsupplies/core/common_colors.dart';
import 'package:petsupplies/core/common_dimens.dart';
import 'package:petsupplies/home/favourite_listing.dart';
import 'package:petsupplies/home/supply_list.dart';
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
            body: Stack(
              children: [
                ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
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
                          CartIcon(),
                        ],
                      ),
                    ),
                    SupplyList(),
                    if (Provider.of<SupplyProviderModel>(providerContext)
                            .selectedIndex ==
                        0)
                      FavouriteProductListing(key: ObjectKey("abdullah"))
                    else
                      FavouriteProductListing(key: ObjectKey("abdullahaa")),
                  ],
                ),
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
