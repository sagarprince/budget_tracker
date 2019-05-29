import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {

  final String message;
  final TextStyle messageStyle;

  NoContent({Key key, this.message = '', this.messageStyle = const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 350.0,
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset('assets/images/no_data_x.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Center(
                    child: Text(message, textAlign: TextAlign.center, style: messageStyle),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}