import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
          onPressed: () {},
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
}
