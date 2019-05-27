import 'package:flutter/material.dart';
import 'package:expense_manager/widgets/month_line_chart.dart';
import 'package:expense_manager/widgets/amount.dart';

class MonthStats extends StatelessWidget {

  final double netBalance;

  MonthStats({Key key, this.netBalance = 0}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 5.0),
                blurRadius: 10.0,
                spreadRadius: 5.0
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Net Balance', style: TextStyle(fontSize: 15.0)),
                SizedBox(height: 10.0),
                Amount(
                  value: netBalance,
                  valueFormatter: '#,##0.00',
                  iconSize: 30.0,
                  iconColor: Colors.black,
                  valueStyle: TextStyle(fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 200.0,
            child: MonthLineChart.withRandomData(),
          )
        ],
      ),
    );
  }
}