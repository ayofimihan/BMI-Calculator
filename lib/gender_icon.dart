import 'package:flutter/material.dart';
import 'constants.dart';

class GenderIcon extends StatelessWidget {
  final IconData icon;
  final String gender;
  GenderIcon({this.icon, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          gender,
          style: labelTextStyle,
        )
      ],
    );
  }
}
