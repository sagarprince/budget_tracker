import 'package:flutter/material.dart';
import 'package:expense_manager/constants.dart';

class ArcShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height / 1.2);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 1.2);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ArcAppBar extends StatelessWidget {
  final Widget child;

  ArcAppBar({Key key, this.child}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = screenHeight / 1.75;

    final double statusbarHeight = MediaQuery.of(context).padding.top;
    final double appBarTopPosition = statusbarHeight;

    return Stack(
      key: this.key,
      children: <Widget>[
        ClipPath(
          clipper: ArcShapeClipper(),
          child: Container(
              height: appBarHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.primaryColor, AppColors.secondaryColor]
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: appBarTopPosition,
                    width: MediaQuery.of(context).size.width,
                    child: (this.child != null) ? this.child : Container(),
                  )
                ],
              )
          ),
        )
      ],
    );
  }
}