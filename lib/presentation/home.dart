import 'package:flutter/material.dart';
import 'dart:async';
import 'package:expense_manager/widgets/menu_screen.dart';
import 'package:expense_manager/widgets/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_manager/utilities/calendar_utility.dart';
import 'package:expense_manager/constants.dart';
import 'package:expense_manager/widgets/arc_app_bar.dart';
import 'package:expense_manager/widgets/wallet_overview.dart';
import 'package:expense_manager/widgets/transaction_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMenuItemId = '';
  DrawerScaffoldController controller = DrawerScaffoldController();

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
        controller: controller,
        percentage: 0.6,
        showAppBar: false,
        menuView: new MenuView(
            menu: App.menus,
            animation: false,
            color: Theme.of(context).primaryColor,
            selectedItemId: selectedMenuItemId,
            selectorColor: AppColors.menuSelectedColor,
            textStyle: AppTextStyles.menuText,
            onMenuItemSelected: (String itemId) {
              setState(() {
                selectedMenuItemId = itemId;
                controller.open = false;
              });
              Future.delayed(const Duration(milliseconds: 400), () {
                Navigator.pushNamed(context, itemId);
              });
            }
        ),
        contentView: Screen(
            contentBuilder: (context) {
              return HomePageContent(
                onToggleDrawer: () {
                  setState(() {
                    controller.open = !controller.isOpen();
                  });
                },
              );
            }
        )
    );
  }
}

class HomePageContent extends StatefulWidget {
  final VoidCallback onToggleDrawer;

  HomePageContent({Key key, @required this.onToggleDrawer}):
        assert(onToggleDrawer != null),
        super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  dynamic selectedMonth = '';
  DateTime _selectedDate = new DateTime.now();
  DateTime get selectedDate => _selectedDate;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedMonth = CalendarUtility.formatMonth(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ArcAppBar(
            child: Container(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: new IconButton(
                          padding: EdgeInsets.all(0.0),
                          alignment: Alignment.centerLeft,
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          iconSize: 28.0,
                          onPressed: () {
                            widget.onToggleDrawer();
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(AppText.appTitle, textAlign: TextAlign.center, style: AppTextStyles.appTitle),
                        ),
                      ),
                      SizedBox(
                          width: 36.0
                      )
                    ],
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 0.0, bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(selectedMonth, style: TextStyle(fontSize: 18.0, color: Colors.white)),
                        IconButton(
                          onPressed: () => selectDateFromPicker(),
                          icon: Icon(FontAwesomeIcons.calendarAlt, color: Colors.white),
                          iconSize: 22.0,
                        )
                      ],
                    ),
                  ),
                  WalletOverview(
                      balanceAmount: '48,000',
                      totalBudget: '60,000',
                      spend: '12,000'
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: _latestTransaction(),
          )
        ],
      ),
    );
  }

  Future<Null> selectDateFromPicker() async {
    DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2050),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = selected;
        selectedMonth = CalendarUtility.formatMonth(selectedDate);
      });
    }
  }

  Widget _latestTransaction() {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
            margin: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                color: AppColors.thirdColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: Text(AppText.latestTransactionText, style: AppTextStyles.latestTransactionText),
          ),
          Expanded(
            child: new ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(top: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return TransactionCard(
                    category: (index % 2 == 0) ? 'bank' : 'cash',
                    title: (index % 2 == 0) ? 'Bank Transfer' : 'Cash',
                    description: 'Hdfc bank transfer **** 456 testing 123 23233',
                    date: 'May 22',
                    isCredited: (index % 2 == 0) ? false : true,
                    amount: (index % 2 == 1) ? '500' : '1000',
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
                    onPressed: () {
                      print(index);
                    },
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}