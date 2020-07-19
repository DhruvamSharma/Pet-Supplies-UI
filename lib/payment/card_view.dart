import 'package:flutter/material.dart';
import 'package:petsupplies/payment/credit_card.dart';
import 'package:provider/provider.dart';

class CardView extends StatefulWidget {
  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  final PageController controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    Provider.of<OffsetModel>(context, listen: false).init(controller);
    return PageView(
      controller: controller,
      physics: Provider.of<CardHolderModel>(context).currentIndex == -1
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        Provider.of<CardHolderModel>(context, listen: false)
            .assignPageNumber(index);
      },
      children: [
        CreditCardView(
          imageUrl:
              'https://i.pinimg.com/736x/5c/ee/af/5ceeafdc811d2269821fb03df29374ff.jpg',
          name: "Dhruvam",
          cardNumber: "7826387623876238",
          index: 0,
          color: Colors.orange,
        ),
        CreditCardView(
          imageUrl:
              'https://us.123rf.com/450wm/grebeshkovmaxim/grebeshkovmaxim1805/grebeshkovmaxim180500202/100769321-colorful-smooth-gradient-color-background-design-for-your-project-design-.jpg?ver=6',
          name: "Dhruvam",
          cardNumber: "43368347687292380",
          index: 1,
          color: Colors.orange,
        ),
        CreditCardView(
          imageUrl:
              'https://ak5.picdn.net/shutterstock/videos/1018020805/thumb/1.jpg',
          name: "Dhruvam",
          cardNumber: "98278372999789899",
          index: 2,
          color: Colors.orange,
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class CardHolderModel extends ChangeNotifier {
  int index = 0;
  int currentIndex = -1;
  bool isPaymentDone = false;
  assignPageNumber(int index) {
    this.index = index;
    notifyListeners();
  }

  assignCurrentIndex(int pageNumber) {
    currentIndex = pageNumber;
    notifyListeners();
  }

  assignIsPaymentDone(bool isDone) {
    isPaymentDone = isDone;
    notifyListeners();
  }
}

class OffsetModel extends ChangeNotifier {
  double _pageNumber = 0;
  double _offset = 0;

  double get pageNumber => _pageNumber;
  double get offset => _offset;

  void init(PageController controller) {
    controller.addListener(() {
      _pageNumber = controller.page;
      _offset = controller.offset;
      notifyListeners();
    });
  }
}
