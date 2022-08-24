import 'package:flutter/cupertino.dart';
import 'package:movie_bloc/view/drawer_menu/view/drawer_page.dart';
import 'package:movie_bloc/view/home/view/home_page.dart';

enum RouteDefine {
  home,
  drawerMenu,
}

class AppRouting {
  static CupertinoPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.drawerMenu.name: (_) => const DrawerPage(),
      RouteDefine.home.name: (_) => const HomePage(),
    };
    final routeBuilder = routes[settings.name];
    return CupertinoPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}
