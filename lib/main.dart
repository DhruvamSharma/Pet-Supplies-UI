import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petsupplies/core/common_colors.dart';
import 'package:petsupplies/core/routes.dart';
import 'package:petsupplies/home/favourite_list.dart';
import 'package:petsupplies/home/home_page.dart';
import 'package:petsupplies/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'core/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(),
      child: ChangeNotifierProvider<CartModel>(
        create: (_) => CartModel(),
        child: Builder(
          builder: (providerContext) => MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: SplashScreenRoute.routeName,
            theme: Provider.of<ThemeModel>(providerContext).appTheme,
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "${appName}_${versionName}_${homePage}_home";
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: CommonColors.accentColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < iconList.length; i++)
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          iconList[i],
                          size: 30,
                          color: CommonColors.iconColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            titleList[i],
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: CommonColors.iconColor,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
        HomePage(controller),
      ],
    );
  }

  final List<IconData> iconList = [
    FlutterIcons.bone_mco,
    FlutterIcons.paw_mco,
    FlutterIcons.ribbon_mco,
    FlutterIcons.food_apple_mco,
  ];

  final List<String> titleList = [
    "Bones",
    "Paw Grooming",
    "Safety",
    "Pet Food",
  ];
}

class CartModel extends ChangeNotifier {
  final List<SupplyItemModel> cart = List();

  void addItemToCart(SupplyItemModel item) {
    cart.add(item);
    notifyListeners();
  }
}

class ThemeModel extends ChangeNotifier {
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: CommonColors.accentColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CommonColors.accentColor,
    ),
  );
  final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: CommonColors.accentColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CommonColors.accentColor,
    ),
  );

  ThemeData appTheme;

  ThemeModel() {
    appTheme = lightTheme;
  }

  void toggleTheme() {
    if (appTheme == lightTheme) {
      appTheme = darkTheme;
    } else {
      appTheme = lightTheme;
    }
    notifyListeners();
  }
}
