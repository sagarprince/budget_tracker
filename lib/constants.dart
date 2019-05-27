import 'package:flutter/material.dart';
import 'package:expense_manager/widgets/menu_screen.dart';

class App {
  const App();
  static final Menu menus = new Menu(
    items: [
      new MenuItem(
        id: '/daily',
        title: 'Daily',
        icon: Icons.calendar_view_day,
      ),
      new MenuItem(
        id: '/stats',
        title: 'Stats',
        icon: Icons.multiline_chart,
      ),
      new MenuItem(
        id: '/accounts',
        title: 'Accounts',
        icon: Icons.account_balance_wallet,
      ),
      new MenuItem(
        id: '/settings',
        title: 'Settings',
        icon: Icons.settings,
      ),
    ],
  );
}

class AppColors {
  const AppColors();
  static const Color primaryColor = const Color(0xffFF3378);
  static const Color secondaryColor = const Color(0xffFF2525);
  static const Color thirdColor = const Color(0xff33C9FF);
  static const Color fourthColor = const Color(0xffFF3325);
  static const Color menuSelectedColor = const Color(0xffFFFFFF);
}

class AppText {
  const AppText();
  static const String appTitle = 'Budget Tracker';
  static const String balanceText = 'Available Balance';
  static const String totalBudgetText = 'Total Budget';
  static const String spendText = 'Spend';
  static const String latestTransactionText = 'Latest Transaction';
}

class AppTextStyles {
  const AppTextStyles();
  static const TextStyle appTitle = const TextStyle(fontSize: 20.0, color: Colors.white);
  static const TextStyle menuText = const TextStyle(color: Colors.black45, fontSize: 18.0);
  static const TextStyle balanceText = const TextStyle(fontSize: 17.0, color: Colors.white);
  static const TextStyle balanceAmount = const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, color: Colors.white);
  static const TextStyle latestTransactionText = const TextStyle(fontSize: 17.0, color: Colors.white);
}