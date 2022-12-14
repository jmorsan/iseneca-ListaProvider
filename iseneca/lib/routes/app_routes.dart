import 'package:iseneca/models/menu_option.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[
    MenuOption(
        route: 'home',
        icon: Icons.home,
        name: 'Home Screen',
        screen: const HomeScreen()
      ),
    MenuOption(
        route: 'menu',
        icon: Icons.home,
        name: 'DashBoard',
        screen: const DashboardScreen()
      ),
    MenuOption(
        route: 'alumnadocentro',
        icon: Icons.home,
        name: 'AlumnadoCentro',
        screen: const AlumnadoCentroScreen()
      ),
    MenuOption(
        route: 'expulsados',
        icon: Icons.home,
        name: 'AlumnosExpulsados',
        screen: const AlumnosExpulsadosScreen()
      ),
      MenuOption(
        route: 'convivencia',
        icon: Icons.home,
        name: 'AlumnosConvivencia',
        screen: const AlumnosConvivenciaScreen()
      ),
      MenuOption(
        route: 'personalcentro',
        icon: Icons.home,
        name: 'PersonalCentro',
        screen: const PersonalCentroScreen()
      ),
      MenuOption(
        route: 'perfil',
        icon: Icons.home,
        name: 'Perfil',
        screen: const ProfileScreen()
      ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
