import 'package:flutter/material.dart';
import 'package:petsupplies/home_page.dart';
import 'package:provider/provider.dart';

import 'common_dimens.dart';

class FavouriteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: CommonDimens.leftRightPadding / 2),
      height: 280,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: CommonDimens.leftRightPadding,
              bottom: CommonDimens.leftRightPadding / 2,
            ),
            child: GestureDetector(
              onTap: () {
                Provider.of<SupplyProviderModel>(context, listen: false)
                    .assignIndex(index);
              },
              child: SizedBox(
                width: 200,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation:
                      Provider.of<SupplyProviderModel>(context).selectedIndex ==
                              index
                          ? 8
                          : 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        CommonDimens.leftRightPadding,
                      ),
                      bottomLeft: Radius.circular(
                        CommonDimens.leftRightPadding / 10,
                      ),
                      topLeft: Radius.circular(
                        CommonDimens.leftRightPadding / 10,
                      ),
                      topRight: Radius.circular(
                        CommonDimens.leftRightPadding / 10,
                      ),
                    ),
                  ),
                  child: Image.network(
                    favouriteItemList[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: favouriteItemList.length,
      ),
    );
  }

  final favouriteItemList = [
    "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-6_250x.jpg?v=1588483432",
    "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-5_250x.jpg?v=1588483430",
    "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-3_250x.jpg?v=1588483434",
    "https://cdn.shopify.com/s/files/1/0086/0795/7054/files/cf-cat-banner-2_250x.jpg?v=1588483433",
  ];
}
