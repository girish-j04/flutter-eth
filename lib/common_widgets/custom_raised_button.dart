

import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {

  CustomRaisedButton({this.child,
    this.color,
    this.borderRadius: 8.0,
    this.onPressed,
    this.height: 50,
  }): assert(borderRadius != null);
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        color: color,
        onPressed: onPressed,
      ),
      height: height,
    );
  }
}
