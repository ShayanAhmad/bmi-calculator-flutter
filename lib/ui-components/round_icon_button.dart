import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Widget child;
  final Function on_pressed;
  RoundIconButton({@required this.child, @required this.on_pressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: on_pressed,
      child: child,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
    );
  }
}
