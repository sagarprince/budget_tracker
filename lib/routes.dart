import 'package:expense_manager/presentation/daily.dart';
import 'package:expense_manager/presentation/stats.dart';
import 'package:expense_manager/presentation/accounts.dart';
import 'package:expense_manager/presentation/settings.dart';

class Routes {
  static builder() {
    return {
      '/daily': (context) => DailyPage(),
      '/stats': (context) => StatsPage(),
      '/accounts': (context) => AccountsPage(),
      '/settings': (context) => SettingsPage(),
    };
  }
}