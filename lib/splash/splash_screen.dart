import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:petsupplies/core/common_colors.dart';
import 'package:petsupplies/core/common_dimens.dart';
import 'package:petsupplies/main.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';

class SplashScreenRoute extends StatefulWidget {
  static const String routeName = "${appName}_${versionName}_${splash}_splash";

  @override
  _SplashScreenRouteState createState() => _SplashScreenRouteState();
}

class _SplashScreenRouteState extends State<SplashScreenRoute> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Lottie.network(
                  "https://assets1.lottiefiles.com/temp/lf20_tsdGdl.json",
                  height: 300,
                  width: 300,
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 100),
                duration: Duration(
                  seconds: 5,
                ),
                curve: Curves.bounceIn,
                builder: (_, double progress, Widget child) {
                  Provider.of<SplashProgressNotifier>(context, listen: false)
                      .assignProgress(progress.round());
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: LinearProgressIndicator(
                      value: progress / 100,
                      backgroundColor: CommonColors.progressBarBackgroundColor,
                    ),
                  );
                },
                onEnd: () {
                  setState(() {});
                },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: CommonDimens.leftRightPadding,
                ),
                child: Text(
                  "Setting up your account",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -90,
          left: -100,
          child: CircleAvatar(
            radius: Provider.of<SplashProgressNotifier>(context, listen: true)
                    .progress
                    .toDouble() *
                3,
            child: Column(
              children: [
                Lottie.network(
                    "https://assets4.lottiefiles.com/packages/lf20_PXcBlV.json",
                    height: 300),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyHomePage.routeName);
                    },
                    child: Text(
                      "Join Now",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: CommonColors.iconColor),
                    ),
                    color: CommonColors.accentColor,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class SplashProgressNotifier extends ChangeNotifier {
  int progress = 0;

  void assignProgress(int i) {
    progress = i;
  }
}
