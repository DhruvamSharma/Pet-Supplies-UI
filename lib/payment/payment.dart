import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petsupplies/core/common_colors.dart';
import 'package:petsupplies/core/common_dimens.dart';
import 'package:petsupplies/core/constants.dart';
import 'package:petsupplies/payment/app_bar.dart';
import 'package:petsupplies/payment/card_view.dart';
import 'package:petsupplies/payment/top_panel.dart';
import 'package:provider/provider.dart';

class PaymentRoute extends StatelessWidget {
  static const String routeName =
      "${appName}_${versionName}_${paymentModule}_payment";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OffsetModel>(
      create: (_) => OffsetModel(),
      child: ChangeNotifierProvider<CardHolderModel>(
        create: (_) => CardHolderModel(),
        child: Builder(
          builder: (providerContext) => Material(
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      PetAppBar(),
                      PaymentTopPanel(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: CommonDimens.statusBarTopPadding,
                          ),
                          child: CardView(),
                        ),
                      ),
                    ],
                  ),
                  if (Provider.of<CardHolderModel>(providerContext)
                              .currentIndex !=
                          -1 &&
                      !Provider.of<CardHolderModel>(providerContext)
                          .isPaymentDone)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 400, end: 0),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        builder: (_, double progress, Widget child) {
                          return Transform.translate(
                            offset: Offset(0, progress),
                            child: child,
                          );
                        },
                        child: Row(
                          children: [
                            Lottie.network(
                              "https://assets1.lottiefiles.com/packages/lf20_lc6foY.json",
                              height: 200,
                              width: 200,
                            ),
                            OutlineButton(
                                onPressed: () {
                                  Provider.of<CardHolderModel>(providerContext,
                                          listen: false)
                                      .assignIsPaymentDone(true);
                                },
                                child: Text(
                                  "Pay    \$211",
                                  style: Theme.of(context).textTheme.headline6,
                                ))
                          ],
                        ),
                      ),
                    ),
                  if (Provider.of<CardHolderModel>(providerContext)
                              .currentIndex !=
                          -1 &&
                      Provider.of<CardHolderModel>(providerContext,
                              listen: true)
                          .isPaymentDone)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 200, end: 0),
                        duration: Duration(
                          milliseconds: 300,
                        ),
                        builder: (_, double progress, Widget child) {
                          return Transform.translate(
                            offset: Offset(0, progress),
                            child: child,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: CommonDimens.leftRightPadding * 2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Payment Done",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Lottie.network(
                                "https://assets8.lottiefiles.com/datafiles/CkH8YIYkFwO9g8t/data.json",
                                height: 100,
                                width: 200,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
