import 'package:flutter/material.dart';
import 'package:hungry_place/screens/home.dart';
import 'package:flutter/foundation.dart';

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.home_outlined),
    label: 'Home',
    selectedIcon: Icon(Icons.home),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.category_outlined),
    label: 'Categories',
    selectedIcon: Icon(Icons.category),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.shopping_basket_outlined),
    label: 'Cart',
    selectedIcon: Icon(Icons.shopping_basket),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.login),
    label: 'Login',
    selectedIcon: Icon(Icons.login),
  ),
  NavigationDestination(
    tooltip: "",
    icon: Icon(Icons.info_outline),
    label: 'Info',
    selectedIcon: Icon(Icons.info),
  )
];

int _selectedIndex = 0;

final List<NavigationRailDestination> navRailDestinations = appBarDestinations
    .map(
      (destination) => NavigationRailDestination(
        icon: Tooltip(
          message: destination.label,
          child: destination.icon,
        ),
        selectedIcon: Tooltip(
          message: destination.label,
          child: destination.selectedIcon,
        ),
        label: Text(destination.label),
      ),
    )
    .toList();

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        handleNavigation(index, context);
      },
      destinations: appBarDestinations,
    );
  }
}

class NavigationRailSection extends StatefulWidget {
  const NavigationRailSection({super.key});

  @override
  State<NavigationRailSection> createState() => _NavigationRailSectionState();
}

class _NavigationRailSectionState extends State<NavigationRailSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      minWidth: 50,
      destinations: navRailDestinations,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        handleNavigation(index, context);
      },
    );
  }
}

// TODO:
// https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
// Advanced named routes with onGenerateRoute
// OR *Navigator 2.0 exercise*

void handleNavigation(int index, BuildContext context) {
  _selectedIndex = index;
  print(index);
  if (kIsWeb) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        return;
      case 1:
        Navigator.pushReplacementNamed(context, '/home');
        return;
      case 2:
        Navigator.pushReplacementNamed(context, '/home');
        return;
      case 3:
        Navigator.pushReplacementNamed(context, '/login');
        return;
      default:
        Navigator.pushReplacementNamed(context, '/home');
    }
  } else {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        return;
      case 1:
        Navigator.pushReplacementNamed(context, '/home');
        return;
      case 2:
        Navigator.pushReplacementNamed(context, '/home');
        return;
      case 3:
        Navigator.pushReplacementNamed(context, '/login');
        return;
      default:
        Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
