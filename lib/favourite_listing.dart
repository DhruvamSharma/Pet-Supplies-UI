import 'package:flutter/material.dart';
import 'package:petsupplies/common_dimens.dart';
import 'package:petsupplies/favourite_list.dart';

class FavouriteProductListing extends StatelessWidget {
  final key;
  FavouriteProductListing({this.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimens.leftRightPadding,
            vertical: CommonDimens.leftRightPadding / 4,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Favourites - ",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                "Pet Items",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Spacer(),
              Text(
                "See all",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
                visualDensity: VisualDensity.compact,
                onPressed: () {},
              )
            ],
          ),
        ),
        FavouriteListWidget(),
      ],
    );
  }
}
