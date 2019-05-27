import 'package:flutter/material.dart';
import 'package:expense_manager/widgets/month_year_picker.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
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
            child: MonthYearPicker(onSelected: (DateTime date) {
              print(date);
            })
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}

