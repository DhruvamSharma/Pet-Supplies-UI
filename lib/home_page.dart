import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petsupplies/cart_icon.dart';
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
            body: Stack(
              children: [
                Positioned(
                  bottom: -80,
                  right: -50,
                  child: Image.network(
                    "https://storage.needpix.com/rsynced_images/silhouette-3263081_1280.png",
                    height: 300,
                    width: 300,
                    color: CommonColors.accentColor.withOpacity(0.2),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).padding.top,
                  width: MediaQuery.of(context).size.width,
                  color: CommonColors.primaryColorDark,
                ),
                ListView(
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
                    FavouriteProductListing(),
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
