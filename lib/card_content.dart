import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key, this.icon, this.label});

  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        // This SizedBox is used to make a space between the 2 elements!
        const SizedBox(height: 15.0),
        Text(
          label ?? '',
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
