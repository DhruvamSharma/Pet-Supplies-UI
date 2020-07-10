import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petsupplies/common_colors.dart';
import 'package:petsupplies/common_dimens.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class SupplyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow:
                      Provider.of<SupplyProviderModel>(context).selectedIndex ==
                              index
                          ? [
                              BoxShadow(
                                color: Colors.orange[200],
                                blurRadius:
                                    5.0, // has the effect of softening the shadow
                                spreadRadius:
                                    5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0.0, // horizontal, move right 10
                                  3.0, // vertical, move down 10
                                ),
                              )
                            ]
                          : null,
                ),
                child: CircleAvatar(
                  backgroundColor: CommonColors.accentColor,
                  radius:
                      Provider.of<SupplyProviderModel>(context).selectedIndex ==
                              index
                          ? 40
                          : 30,
                  child: Icon(
                    FlutterIcons.ac_unit_mdi,
                    color: CommonColors.iconColor,
                  ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 6,
      ),
    );
  }
}
