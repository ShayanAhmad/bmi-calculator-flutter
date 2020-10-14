import 'package:flutter/material.dart';

import '../constants.dart';

class CalculateButton extends StatelessWidget {
  String title;
  Function on_tap;
  CalculateButton({@required this.title, @required this.on_tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: on_tap,
      child: Container(
        color: kPINK,
        width: double.infinity,
        height: kCALCULATE_BTN_HEIGHT,
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            title,
            style: kCALCULATE_BTN_TEXT_STYLE,
          ),
        ),
      ),
    );
  }
}
