import 'package:flutter/material.dart';
import 'constants.dart';

class PinkButton extends StatelessWidget {
  PinkButton({@required this.calcText, @required this.onTap});
  final String calcText;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            calcText,
            style: kcalculateButtonTextStyle,
          ),
        ),
        color: bottomContainerColor,
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
