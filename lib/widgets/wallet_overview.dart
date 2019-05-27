import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expense_manager/constants.dart';
import 'package:expense_manager/widgets/amount.dart';

class WalletOverview extends StatelessWidget {
  final dynamic balanceAmount;
  final dynamic totalBudget;
  final dynamic spend;

  WalletOverview({
    Key key,
    this.balanceAmount = '0',
    this.totalBudget = '0',
    this.spend = '0'
  }): super(key: key);

  Widget _balance() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(FontAwesomeIcons.wallet, color: Colors.white, size: 25.0),
          SizedBox(height: 15.0),
          Text(AppText.balanceText, style: AppTextStyles.balanceText),
          SizedBox(height: 15.0),
          Amount(
            value: balanceAmount,
            iconSize: 24.0,
            valueStyle: AppTextStyles.balanceAmount,
          )
        ],
      ),
    );
  }

  Widget _info() {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 2.0, color: Colors.deepOrangeAccent),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppText.totalBudgetText, style: TextStyle(fontSize: 16.0, color: Colors.white)),
              SizedBox(height: 5.0),
              Amount(
                value: totalBudget,
                iconSize: 16.0,
                valuePadding: EdgeInsets.only(left: 5.0),
                valueStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              )
            ],
          ),
          SizedBox(height: 25.0),
          Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppText.spendText, style: TextStyle(fontSize: 16.0, color: Colors.white)),
              SizedBox(height: 5.0),
              Amount(
                value: spend,
                iconSize: 16.0,
                valuePadding: EdgeInsets.only(left: 5.0),
                valueStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.deepOrangeAccent),
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _balance(),
          _info()
        ],
      ),
    );
  }
}