import 'package:bmi_calculator/pages/results.dart';
import 'package:bmi_calculator/service/bmi_service.dart';
import 'package:bmi_calculator/ui-components/CalculateButton.dart';
import 'package:bmi_calculator/ui-components/bmi_card.dart';
import 'package:bmi_calculator/ui-components/bmi_card_content.dart';
import 'package:bmi_calculator/ui-components/round_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 74;
  int _age = 20;
  Color male_card_bg_color = kINACTIVE_CARD_BG_COLOR;
  Color female_card_bg_color = kINACTIVE_CARD_BG_COLOR;

  void toggleActiveGenderCardColor(Gender gender) {
    if (Gender.MALE == gender) {
      male_card_bg_color = kACTIVE_CARD_BG_COLOR;
      female_card_bg_color = kINACTIVE_CARD_BG_COLOR;
    } else {
      male_card_bg_color = kINACTIVE_CARD_BG_COLOR;
      female_card_bg_color = kACTIVE_CARD_BG_COLOR;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    colour: male_card_bg_color,
                    cardChild: IconContentWidget(
                      label: enumToString(Gender.MALE),
                      icon: FontAwesomeIcons.mars,
                    ),
                    on_tap: () {
                      setState(() {
                        toggleActiveGenderCardColor(Gender.MALE);
                      });
                    },
                  ),
                ),
                Expanded(
                    child: BMICard(
                  colour: female_card_bg_color,
                  cardChild: IconContentWidget(
                    label: enumToString(Gender.FEMALE),
                    icon: FontAwesomeIcons.venus,
                  ),
                  on_tap: () {
                    setState(() {
                      toggleActiveGenderCardColor(Gender.FEMALE);
                    });
                  },
                )),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              colour: kACTIVE_CARD_BG_COLOR,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kFIGURE_STYLE,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kWHITE,
                      inactiveTrackColor: kGRAY,
                      thumbColor: kPINK,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: kTRANSLUCENT_PINK,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    colour: kACTIVE_CARD_BG_COLOR,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kFIGURE_STYLE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.minus,
                              ),
                              on_pressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.plus,
                              ),
                              on_pressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    colour: kACTIVE_CARD_BG_COLOR,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kFIGURE_STYLE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.minus,
                              ),
                              on_pressed: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.plus,
                              ),
                              on_pressed: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            title: 'CALCULATE',
            on_tap: () {
              BMIService bmiService =
                  BMIService(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: bmiService.getResult(),
                    bmiLabel: bmiService.getBMILabel(),
                    bmiInterpretation: bmiService.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

String enumToString(Gender gender) {
  return gender.toString().split('.').last;
}

enum Gender { MALE, FEMALE }
