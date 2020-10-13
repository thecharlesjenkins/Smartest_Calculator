import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fraction extends StatelessWidget {
  final String _numerator;
  final String _denominator;

  Fraction(this._numerator, this._denominator);

  Widget get _fraction {
    return IntrinsicWidth(
      child: Column(
        children: <Widget>[
          Text(_numerator),
          Container(
            height: 2,
            color: Colors.black,
          ),
          Text(_denominator),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fraction;
  }

  @override
  String toStringShort() {
    return "$_numerator / $_denominator";
  }
}
