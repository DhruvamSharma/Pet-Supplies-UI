import 'package:flutter/material.dart';
import 'package:petsupplies/core/common_colors.dart';
import 'package:petsupplies/core/common_dimens.dart';
import 'package:petsupplies/home/favourite_list.dart';

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
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: CommonColors.headlineTextColor),
              ),
              Text(
                "Pet Items",
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w300,
                    color: CommonColors.headlineTextColor),
              ),
              Spacer(),
              Text(
                "See all",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: CommonColors.headlineTextColor),
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
