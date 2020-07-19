import 'package:flutter/material.dart';
import 'package:petsupplies/core/common_colors.dart';
import 'package:petsupplies/core/common_dimens.dart';
import 'package:petsupplies/payment/card_view.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

class CreditCardView extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String cardNumber;
  final int index;
  final Color color;
  final MultiTrackTween trackTween = MultiTrackTween([
    Track("rotate").add(
      Duration(milliseconds: 300),
      Tween(begin: 0.0, end: -0.5),
    ),
    Track("scale").add(
      Duration(milliseconds: 300),
      Tween(begin: 1.0, end: 0.5),
    ),
    Track("opacity").add(
      Duration(milliseconds: 300),
      Tween(begin: 1.0, end: 0.0),
    ),
  ]);
  final MultiTrackTween animationCardTween = MultiTrackTween([
    Track("rotate").add(
      Duration(milliseconds: 300),
      Tween(begin: 0.0, end: 1.57),
    ),
    Track("scale").add(
      Duration(milliseconds: 300),
      Tween(begin: 1.0, end: 0.7),
    ),
    Track("translateY").add(
      Duration(milliseconds: 300),
      Tween<Offset>(
        begin: Offset(0, 0),
        end: Offset(0, 150),
      ),
    ),
  ]);
  CreditCardView({
    @required this.imageUrl,
    @required this.name,
    @required this.cardNumber,
    @required this.index,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int currentIndex =
            Provider.of<CardHolderModel>(context, listen: false).currentIndex;
        if (currentIndex == -1) {
          Provider.of<CardHolderModel>(context, listen: false)
              .assignCurrentIndex(index);
        } else {
          Provider.of<CardHolderModel>(context, listen: false)
              .assignCurrentIndex(-1);
        }
      },
      child: Consumer<OffsetModel>(
        builder: (_, OffsetModel model, Widget child) {
          int pageIndex =
              Provider.of<CardHolderModel>(context, listen: true).index;
          int currentIndex =
              Provider.of<CardHolderModel>(context, listen: true).currentIndex;
          bool hideCard;
          if (currentIndex != -1) {
            if (index == currentIndex) {
              hideCard = false;
            } else {
              hideCard = true;
            }
          } else {
            hideCard = false;
          }
          return ControlledAnimation(
            tween: animationCardTween,
            duration: animationCardTween.duration,
            playback: currentIndex != -1
                ? Playback.PLAY_FORWARD
                : Playback.PLAY_REVERSE,
            builder: (context, primaryAnimation) {
              return Transform.translate(
                offset: -primaryAnimation["translateY"],
                child: Transform.rotate(
                  angle: primaryAnimation["rotate"],
                  child: Transform.scale(
                    scale: primaryAnimation["scale"],
                    child: ControlledAnimation(
                      tween: trackTween,
                      duration: trackTween.duration,
                      playback: pageIndex > index
                          ? Playback.PLAY_FORWARD
                          : Playback.PLAY_REVERSE,
                      builder: (context, animation) {
                        return Transform.rotate(
                          angle: animation["rotate"],
                          child: Transform.scale(
                              scale: animation["scale"],
                              child: AnimatedOpacity(
                                duration: Duration(
                                    milliseconds:
                                        currentIndex != -1 ? 50 : 300),
                                opacity: hideCard ? 0 : animation["opacity"],
                                child: child,
                              )),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          child: ClipRRect(
            child: RotatedBox(
              quarterTurns: 2,
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 150,
                    top: 20,
                    child: Image.network(
                      "https://static.thenounproject.com/png/2335582-200.png",
                      color: Colors.amber,
                      height: 50,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 20,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          cardNumber,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                letterSpacing: 5.5,
                              ),
                        )),
                  ),
                  Positioned(
                    left: 50,
                    top: 20,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          name.toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                letterSpacing: 3.5,
                              ),
                        )),
                  ),
                  Positioned(
                    left: 40,
                    bottom: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Positioned(
                    left: 40,
                    bottom: 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.orange.withOpacity(0.9),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "mastercard",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                letterSpacing: 1.5,
                              ),
                        )),
                  ),
                ],
              ),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                CommonDimens.leftRightPadding / 2,
              ),
            ),
          ),
          margin: const EdgeInsets.all(
            CommonDimens.leftRightPadding / 2,
          ),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  CommonDimens.leftRightPadding / 2,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  offset: Offset(
                    0,
                    10,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
