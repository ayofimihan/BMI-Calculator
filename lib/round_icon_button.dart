import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function incDec;
  final Color iconColor;
  RoundIconButton(
      {@required this.icon, @required this.incDec, @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: incDec,
      child: Icon(
        icon,
        color: iconColor,
      ),
      fillColor: Colors.grey,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
