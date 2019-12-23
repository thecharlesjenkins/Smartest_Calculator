import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartest_calculator/utils/series/term_formatting.dart';

class TermDisplay extends StatelessWidget {
  final String title;
  final TermFormatting term;
  final Decimal x;
  final int n;

  const TermDisplay({Key key, this.title, this.term, this.x, this.n})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: term.display(x, n),
    );
  }

  void onTapped() {}
}
