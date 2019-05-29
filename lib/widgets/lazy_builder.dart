import 'package:flutter/material.dart';

class LazyBuilder extends StatelessWidget {

  final Widget child;
  final int duration;

  LazyBuilder({Key key, this.child, this.duration = 1000}):
        super(key: key);

  Future<dynamic> _wait() async {
    return Future.delayed(Duration(milliseconds: duration), () {
      return 'loaded';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _wait(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      }
    );
  }
}