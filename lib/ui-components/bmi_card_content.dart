import 'package:flutter/material.dart';

import '../constants.dart';

class IconContentWidget extends StatelessWidget {
  final String label;
  final IconData icon;

  IconContentWidget({@required this.label, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kCUSTOM_ICON_SIZE,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
