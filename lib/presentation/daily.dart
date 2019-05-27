import 'package:flutter/material.dart';
import 'package:expense_manager/widgets/calendar.dart';
//import 'package:expense_manager/constants.dart';
import 'package:expense_manager/widgets/transaction_card.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Transactions'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 5.0
                  ),
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))
            ),
            child: new Calendar(
                onDateSelected: (date) {
//                  print(date);
                }
            ),
          ),
          Expanded(child: _transactions())
        ],
      ),
    );
  }

  Widget _transactions() {
    return new Container(
      padding: EdgeInsets.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
                    amount: (index % 2 == 1) ? 500 : 1000,
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

