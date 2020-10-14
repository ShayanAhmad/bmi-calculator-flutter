import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/ui-components/CalculateButton.dart';
import 'package:bmi_calculator/ui-components/bmi_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  String bmiResult;
  String bmiLabel;
  String bmiInterpretation;

  ResultsPage({this.bmiResult, this.bmiLabel, this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULTS'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kLARGE_TEXT_50,
            ),
          ),
          Expanded(
            child: BMICard(
              colour: kACTIVE_CARD_BG_COLOR,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiLabel,
                    style: kRESULT_LABEL,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    bmiResult,
                    style: kLARGE_TEXT_100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    bmiInterpretation,
                    maxLines: 20,
                    style: kNORMAL_TEXT_20,
                  )
                ],
              ),
            ),
          ),
          CalculateButton(
            title: 'RE-CALCULATE YOUR BMI',
            on_tap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
