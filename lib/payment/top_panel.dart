import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petsupplies/core/common_dimens.dart';

class PaymentTopPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimens.leftRightPadding / 2,
        vertical: CommonDimens.leftRightPadding / 2,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Payment",
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: CommonDimens.leftRightPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Balance"),
                Text(
                  NumberFormat.currency(name: "INR").currencySymbol + " 2218",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
