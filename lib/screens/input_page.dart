import 'dart:ffi';

import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../components/resusable_card.dart';
import '../calculator_brain.dart';

enum Gender { male, female, defaultEnum }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.defaultEnum;
  int height = 180;
  int weight = 60;
  int age = 20;
  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  //
  // void updateColor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColor;
  //       femaleCardColour = inactiveCardColour;
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femaleCardColour == inactiveCardColour) {
  //       femaleCardColour = activeCardColor;
  //       maleCardColour = inactiveCardColour;
  //     } else {
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  // }

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
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColour,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColour,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'Female'),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'CM',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 24.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        //activeColor: Colors.white, //Color(0xFFEB1555),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 20.0),
                            // FloatingActionButton(
                            //     backgroundColor: Color(0xFF4C4F5E),
                            //     child: Icon(Icons.delete),
                            //     onPressed: () {}),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
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
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 20.0),
                            // FloatingActionButton(
                            //     backgroundColor: Color(0xFF4C4F5E),
                            //     child: Icon(Icons.delete),
                            //     onPressed: () {}),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calcBrain =
                  CalculatorBrain(height: height, weight: weight);

              // calcBrain.calculateBMI();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmiResult: calcBrain.calculateBMI(),
                      resultText: calcBrain.getResult(),
                      interpretation: calcBrain.getInterpretation()),
                ),
              );
            },
          )
        ],
        // child: Text(
        //   'Body Text',
        //   // style: TextStyle(color: Colors.white),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {},
      ),
    );
  }
}

//() {
//         onTap();
//},

//Container(
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           color: Color(0xff1D1E33),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//
//typedef Int2VoidFunc = void Function()?;
