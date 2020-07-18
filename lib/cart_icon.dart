import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:petsupplies/common_dimens.dart';
import 'package:petsupplies/main.dart';
import 'package:provider/provider.dart';

import 'common_colors.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartModel>(context);
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            FlutterIcons.shopping_bag_fea,
            color: CommonColors.accentColor,
          ),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: CommonColors.bottomSheetColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        if (cartState.cart.isEmpty) buildEmptyCart(context),
                      ],
                    ),
                  );
                });
          },
        ),
        if (cartState.cart.isNotEmpty)
          Positioned(
            right: 5,
            top: 5,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: CommonColors.accentColor,
              child: Text(
                "${cartState.cart.length}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: CommonColors.cardColor),
              ),
            ),
          ),
      ],
    );
  }

  Widget buildEmptyCart(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: CommonDimens.leftRightPadding),
          child: Text(
            "Uh oh!",
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: CommonColors.headlineTextColor,
                ),
          ),
        ),
        Text(
          "Uh oh! Your cart seems empty",
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: CommonColors.headlineTextColor,
              ),
        ),
        Lottie.network(
          "https://assets8.lottiefiles.com/packages/lf20_C31OHO.json",
          height: 400,
          width: 300,
        ),
      ],
    );
  }
}
