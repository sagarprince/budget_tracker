import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Amount extends StatelessWidget {
  final dynamic value;
  final Color iconColor;
  final double iconSize;
  final EdgeInsets valuePadding;
  final TextStyle valueStyle;
  final String valueFormatter;

  Amount({
      Key key,
      @required this.value,
      this.iconColor = Colors.white,
      this.iconSize = 20.0,
      this.valuePadding = const EdgeInsets.only(left: 5.0),
      this.valueStyle = const TextStyle(color: Colors.white, fontSize: 16.0),
      this.valueFormatter = '#,##0'
    }):
      assert(value != null),
      super(key: key);

  Widget get _valueText {
    return Text(
        new NumberFormat(valueFormatter, 'en_US').format(value),
        style: valueStyle
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(FontAwesomeIcons.rupeeSign, color: iconColor, size: iconSize),
        Padding(
          padding: valuePadding,
          child: _valueText,
        )
      ],
    );
  }
}