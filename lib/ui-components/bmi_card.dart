import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function on_tap;
  BMICard({@required this.colour, this.cardChild, this.on_tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: on_tap,
      child: Container(
        margin: EdgeInsets.all(15),
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
