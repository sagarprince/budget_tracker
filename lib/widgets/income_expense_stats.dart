import 'package:flutter/material.dart';
import 'package:expense_manager/constants.dart';
import 'package:expense_manager/widgets/amount.dart';

enum IEStatTypes {
  income,
  expense
}

class IncomeExpenseStats extends StatelessWidget {

  final double value;
  final IEStatTypes type;

  IncomeExpenseStats({Key key, this.value = 0, this.type = IEStatTypes.expense}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
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
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: type == IEStatTypes.income ? AppColors.thirdColor : AppColors.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(40.0))
              ),
              child: Icon(
                  type == IEStatTypes.income ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                  size: 20.0,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Text(
                type == IEStatTypes.income ? 'Income' : 'Expense',
                style: TextStyle(fontSize: 16.0, color: Colors.black38),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Amount(
                      value: value,
                      valueFormatter: '#,##0.00',
                      iconSize: 18.0,
                      iconColor: Colors.black,
                      valueStyle: TextStyle(
                          inherit: true,
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}