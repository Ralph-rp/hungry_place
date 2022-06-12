import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hungry_place/screens/home.dart';
import 'package:hungry_place/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'models/theme_model.dart';

void main() {
  setupWindow();
  runApp(const MyApp());
}

const double windowWidth = 480;
const double windowHeight = 854;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Hungry Place');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
          builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              colorSchemeSeed:
                  themeNotifier.isDark ? Colors.blueAccent : Colors.teal,
              brightness:
                  themeNotifier.isDark ? Brightness.dark : Brightness.light),

          debugShowCheckedModeBanner: false,
          initialRoute: '/login',
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => HomePage(),
            '/cart': (BuildContext context) => HomePage(),
            '/home': (BuildContext context) => HomePage(),
            '/info': (BuildContext context) => HomePage(),
            '/login': (BuildContext context) => LoginPage(),
            '/register': (BuildContext context) => HomePage(),
          },
        );
      }),
    );
  }
}

const double narrowScreenWidthThreshold = 450;

PreferredSizeWidget createAppBar(
    bool isDark, ThemeModel themeNotifier, BuildContext context) {
  return AppBar(
    title: ElevatedButton.icon(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      icon: const Icon(
        Icons.download,
        size: 24.0,
      ),
      label: const Text('Download'),
    ),
    actions: [
      IconButton(
        icon: isDark
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
        onPressed: () {
          themeNotifier.isDark
              ? themeNotifier.isDark = false
              : themeNotifier.isDark = true;
        },
        tooltip: "Toggle dark mode",
      ),
    ],
  );
}
