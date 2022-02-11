import 'package:bmi_calculator/Results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'gender_icon.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'pink_button.dart';
import 'package:bmi_calculator/Calculator_brain.dart';

enum Gender {
  male,
  female,
}

int startHeight = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  Gender selectedGender;

  // void updateColor(Gender gender){
  //   if (gender == Gender.male){
  //     if (maleCardColor == inactiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     }
  //     else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //     }
  //   else{
  //     if (femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     }
  //     else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: GenderIcon(
                      icon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: GenderIcon(
                      icon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ))
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          startHeight.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25),
                        thumbColor: Colors.pink,
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                      ),
                      child: Slider(
                        value: startHeight.toDouble(),
                        min: minHeight,
                        max: maxHeight,
                        onChanged: (newHeight) {
                          setState(() {
                            startHeight = newHeight.toInt();
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
                      child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              iconColor: Colors.red,
                              incDec: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.cross,
                              iconColor: Colors.greenAccent,
                              incDec: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: activeCardColor,
                  )),
                  Expanded(
                      child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                iconColor: Colors.red,
                                incDec: () {
                                  if (age > 1) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                }),
                            SizedBox(
                              width: 13,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.cross,
                                iconColor: Colors.greenAccent,
                                incDec: () {
                                  if (age < 100) {
                                    setState(() {
                                      age++;
                                    });
                                  }
                                })
                          ],
                        )
                      ],
                    ),
                    colour: activeCardColor,
                  ))
                ],
              ),
            ),
            PinkButton(
              calcText: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: startHeight, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Results(
                    bmii: calc.calculateBmi(),
                    bmiText: calc.getBmiText(),
                    interpretation: calc.getResult(),
                  );
                }));
              },
            )
          ],
        ));
  }
}
