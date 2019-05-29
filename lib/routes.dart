import 'package:flutter/material.dart';
import 'package:expense_manager/presentation/home.dart';
import 'package:expense_manager/presentation/daily.dart';
import 'package:expense_manager/presentation/stats.dart';
import 'package:expense_manager/presentation/accounts.dart';
import 'package:expense_manager/presentation/settings.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}

class Routes {
  static builder() {
    return (RouteSettings settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (_) => HomePage());
          break;
        case '/daily':
          return SlideRightRoute(widget: DailyPage());
          break;
        case '/stats':
          return SlideRightRoute(widget: StatsPage());
          break;
        case '/accounts':
          return SlideRightRoute(widget: AccountsPage());
          break;
        case '/settings':
          return SlideRightRoute(widget: SettingsPage());
          break;
      }
    };
  }
}