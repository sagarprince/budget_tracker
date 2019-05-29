import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:expense_manager/enums.dart';
import 'package:expense_manager/widgets/lazy_builder.dart';
import 'package:expense_manager/widgets/month_year_picker.dart';
import 'package:expense_manager/widgets/month_stats.dart';
import 'package:expense_manager/widgets/income_expense_stats.dart';

class StatsRxService {

  Map _data = {
    'netBalance': Random().nextInt(8293).toDouble(),
    'income': Random().nextInt(9213).toDouble(),
    'expense': Random().nextInt(7343).toDouble()
  };

  BehaviorSubject _subject;

  StatsRxService() {
    _subject = BehaviorSubject.seeded(_data);
  }

  Observable get stream$ => _subject.stream;
  dynamic get data => _subject.value;

  onMonthYearChanged() {
    _data = {
      'netBalance': Random().nextInt(8293).toDouble(),
      'income': Random().nextInt(9213).toDouble(),
      'expense': Random().nextInt(7343).toDouble()
    };
    _subject.add(_data);
  }

  dispose() {
    _subject.close();
  }
}

StatsRxService statsRxService = StatsRxService();

class StatsPage extends StatelessWidget {

  @override
  StatelessElement createElement() {
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      body: LazyBuilder(
        duration: 1500,
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 5.0
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)
                    )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)
                  ),
                  child: MonthYearPicker(onSelected: (DateTime date) {
                    statsRxService.onMonthYearChanged();
                  }),
                )
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: StreamBuilder(
                      stream: statsRxService.stream$,
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        return Column(
                          children: <Widget>[
                            MonthStats(netBalance: (snap.data != null) ? snap.data['netBalance'] : 0),
                            Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IncomeExpenseStats(
                                    type: IEStatTypes.income,
                                    value: (snap.data != null) ? snap.data['income'] : 0,
                                  ),
                                  SizedBox(width: 30.0),
                                  IncomeExpenseStats(
                                    type: IEStatTypes.expense,
                                    value: (snap.data != null) ? snap.data['expense'] : 0,
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

