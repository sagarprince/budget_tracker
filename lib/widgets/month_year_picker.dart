import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/scheduler.dart';
import 'package:expense_manager/constants.dart';
import 'package:expense_manager/utilities/calendar_utility.dart';

class MonthYearPicker extends StatelessWidget {
  final ValueChanged<DateTime> onSelected;

  final ScrollController _controller = new ScrollController();
  DateTime currentDateYear = new DateTime.now();
  String currentMonth = new DateFormat("MMMM").format(DateTime.now());
  DateTime _selectedDate = new DateTime.now();

  MonthYearPicker({Key key, @required this.onSelected}) :
        assert(onSelected != null),
        super(key: key);

  void _scrollToMonth(int index){
    _controller.animateTo((100.0 * index),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  DateTime get selectedDate {
    var year = new DateFormat('yyyy').format(currentDateYear);
    var _month = (CalendarUtility.months.indexOf(currentMonth) + 1).toString();
    var month = (_month.length == 1) ? '0' + _month : _month;
    _selectedDate = DateTime.parse(year+'-'+month+'-01 00:00:00');
    return _selectedDate;
  }

  Widget _monthCard(String name, StateSetter setState) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: currentMonth == name ? AppColors.primaryColor : Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            currentMonth = name;
          });
          int index = CalendarUtility.months.indexOf(currentMonth);
          _scrollToMonth(index);
          onSelected(selectedDate);
        },
        child: Text(name, style: TextStyle(
            fontSize: 16.0,
            color: currentMonth == name ? Colors.white : Colors.black)
        ),
      ),
    );
  }

  void _yearPickerModalSheet(BuildContext context, StateSetter setState){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: YearPicker(
                      selectedDate: currentDateYear,
                      onChanged: (date) {
                        setState(() {
                          currentDateYear = date;
                        });
                        onSelected(selectedDate);
                        Navigator.of(context).pop();
                      },
                      firstDate: new DateTime(1960),
                      lastDate: new DateTime(2050)
                  ),
                )
              ],
            ),
          );
        }
    );
  }

  _afterLayout() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      int index = CalendarUtility.months.indexOf(currentMonth);
      _scrollToMonth(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    _afterLayout();
    return Container(
      height: 90.0,
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 10.0, right: 10.0),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return GestureDetector(
                  onTap: () {
                    _yearPickerModalSheet(context, setState);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          new DateFormat('yyyy').format(currentDateYear),
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue
                          )
                      ),
                      Icon(Icons.keyboard_arrow_down, size: 25.0)
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return ListView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: CalendarUtility.months.map((String name) {
                    return _monthCard(name, setState);
                  }).toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

}