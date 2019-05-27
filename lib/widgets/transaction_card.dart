import 'package:flutter/material.dart';
//import 'package:expense_manager/constants.dart';
import 'package:expense_manager/widgets/amount.dart';

class TransactionCard extends StatelessWidget {
  final dynamic category;
  final String title;
  final String description;
  final String date;
  final bool isCredited;
  final dynamic amount;
  final BoxDecoration decoration;
  final EdgeInsets margin;
  final VoidCallback onPressed;

  TransactionCard({
    Key key,
    @required this.category,
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.isCredited,
    @required this.amount,
    this.decoration = const BoxDecoration(
        color: Colors.transparent,
        border: Border(
            top: BorderSide(color: Colors.black12),
            bottom: BorderSide(color: Colors.black12),
            left: BorderSide(color: Colors.black12),
            right: BorderSide(color: Colors.black12)
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
    ),
    this.margin = const EdgeInsets.all(10.0),
    this.onPressed
  }):
        assert(category != null),
        assert(title != null),
        assert(description != null),
        assert(date != null),
        assert(isCredited != null),
        assert(amount != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: margin,
      decoration: decoration,
      child: RaisedButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(0.0),
        color: Colors.white,
        elevation: 0.0,
        highlightElevation: 0.0,
        highlightColor: Colors.white,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset('assets/images/' + category + '.png'),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          color: Colors.black12
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title, style: TextStyle(fontSize: 16.0)),
                        SizedBox(height: 5.0),
                        Container(
                          constraints: BoxConstraints(maxWidth: 180.0),
                          child: Text(description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(fontSize: 13.0)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Amount(
                  value: amount,
                  iconSize: 16.0,
                  iconColor: isCredited ? Colors.green : Colors.redAccent,
                  valuePadding: EdgeInsets.only(left: 1.0),
                  valueStyle: TextStyle(fontSize: 18.0, color: isCredited ? Colors.green : Colors.redAccent),
                ),
                SizedBox(height: 5.0),
                Text(date, style: TextStyle(fontSize: 13.0))
              ],
            )
          ],
        ),
      ),
    );
  }
}