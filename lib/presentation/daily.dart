import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:expense_manager/enums.dart';
import 'package:expense_manager/models/transaction.dart';

import 'package:expense_manager/widgets/lazy_builder.dart';
import 'package:expense_manager/widgets/calendar.dart';
import 'package:expense_manager/widgets/transaction_card.dart';
import 'package:expense_manager/widgets/no_content.dart';

class DailyRxService {

  BehaviorSubject _subject;
  Map _data = {};
  List<Transaction> transactions = new List<Transaction>();
  List<String> titleList = ['Bank Transfer', 'Cash'];

  DailyRxService() {
    for(var i = 0; i < 20; i++) {
      transactions.add(new Transaction(
        category: (i % 2 == 0) ? 'bank' : 'cash',
        title: titleList[Random().nextInt(2)],
        description: 'Hdfc bank transfer **** 456 testing 123 23233',
        date: new DateTime(2019, 8, 12),
        type: (i % 2 == 0) ? TransactionTypes.credited : TransactionTypes.debited,
        amount: Random().nextInt(2232),
      ));
    }
    _data = {
      'transactions': transactions
    };
    _subject = BehaviorSubject.seeded(_data);
  }

  Observable get stream$ => _subject.stream;
  dynamic get data => _subject.value;

  onDateSelection({bool isEmpty = false}) {
    transactions = [];
    if (!isEmpty) {
      for (var i = 0; i < 20; i++) {
        transactions.add(new Transaction(
          category: (i % 2 == 0) ? 'bank' : 'cash',
          title: titleList[Random().nextInt(2)],
          description: 'Hdfc bank transfer **** 456 testing 123 23233',
          date: new DateTime(2019, 8, 12),
          type: (i % 2 == 0) ? TransactionTypes.credited : TransactionTypes
              .debited,
          amount: Random().nextInt(2232),
        ));
      }
      _data = {
        'transactions': transactions
      };
    } else {
      _data = null;
    }
    _subject.add(_data);
  }

  dispose() {
    _subject.close();
  }
}

DailyRxService dailyRxService = DailyRxService();

class DailyPage extends StatelessWidget {

  Widget _transactions() {
    return new Container(
      padding: EdgeInsets.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: dailyRxService.stream$,
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List<Transaction> transactions = snap.data != null ? snap.data['transactions'] : [];
                  return new ListView.builder(
                      itemCount: transactions.length,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(top: 10.0),
                      itemBuilder: (BuildContext context, int index) {
                        return TransactionCard(
                          category: transactions[index].category,
                          title: transactions[index].title,
                          description: transactions[index].description,
                          date: transactions[index].date,
                          type: transactions[index].type,
                          amount: transactions[index].amount,
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 15.0),
                          onPressed: () {
                            print(index);
                          },
                        );
                      }
                  );
                } else {
                  return SingleChildScrollView(
                    child: NoContent(message: 'No Transactions Yet.'),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Transactions'),
      ),
      body: LazyBuilder(
        duration: 1500,
        child: Column(
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
                  onDateSelected: (DateTime date) {
                    print(date.toIso8601String());
                    var isEmpty = false;
                    if (date.difference(DateTime(2019, 5, 30, 12, 00, 00)).inDays == 0) {
                      isEmpty = true;
                    }
                    dailyRxService.onDateSelection(isEmpty: isEmpty);
                  }
              ),
            ),
            Expanded(child: _transactions())
          ],
        ),
      ),
    );
  }
}

