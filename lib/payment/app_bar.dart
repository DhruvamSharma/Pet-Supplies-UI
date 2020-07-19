import 'package:flutter/material.dart';
import 'package:petsupplies/core/common_dimens.dart';
import 'package:petsupplies/main.dart';
import 'package:provider/provider.dart';

class PetAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: CommonDimens.leftRightPadding / 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Opacity(
              opacity: 1.0,
              child: IconButton(
                  icon: Icon(Icons.lightbulb_outline),
                  onPressed: () {
                    Provider.of<ThemeModel>(context, listen: false)
                        .toggleTheme();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
