import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hungry_place/main.dart';
import 'package:flutter/foundation.dart';
import '../models/theme_model.dart';
import '../navigation/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: createAppBar(themeNotifier.isDark, themeNotifier, context),
        body: SafeArea(
            bottom: false,
            top: false,
            child: Row(
              children: <Widget>[
                if (kIsWeb)
                  (const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NavigationRailSection(),
                  )),
                Row(
                  children: const [
                    Text("asd"),
                    VerticalDivider(thickness: 1, width: 1),
                    Padding(padding: EdgeInsets.symmetric(vertical: 35)),
                    Text("data"),
                  ],
                )
              ],
            )),
        bottomNavigationBar: !kIsWeb ? const NavigationBars() : null,
      );
    });
  }
}
