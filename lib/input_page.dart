import 'dart:developer';

import 'package:bmi_calculator_flutter/card_content.dart';
import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'rounded_icon_button.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int heightOfUser = 180;
  int weightOfUser = 60;
  int ageOfUser = 20;

  void addWeight() {
    setState(() {
      weightOfUser++;
    });
  }

  void addAge() {
    setState(() {
      ageOfUser++;
    });
  }

  void subtractWeight() {
    setState(() {
      weightOfUser--;
    });
  }

  void subtractAge() {
    setState(() {
      ageOfUser--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
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
                        log('Male button was pressed!');
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardsColor
                        : kInactiveCardsColor,
                    cardChild:
                        const CardContent(icon: Icons.male, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                        log('Female button was pressed!');
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? kActiveCardsColor
                          : kInactiveCardsColor,
                      cardChild: const CardContent(
                        icon: Icons.female,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardsColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightOfUser.toString(),
                        style: kNumbersTextStyle,
                      ),
                      const Text(
                        'CM',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      onChanged: (value) {
                        setState(() {
                          heightOfUser = value.round();
                          // log(value.toString());
                        });
                      },
                      value: heightOfUser.toDouble(),
                      inactiveColor: const Color(0xFF8E8D98),
                      min: 120.0,
                      max: 250.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardsColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weightOfUser.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: addWeight,
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: subtractWeight,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardsColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kLabelTextStyle),
                        Text(
                          ageOfUser.toString(),
                          style: kNumbersTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: addAge,
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: subtractAge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              color: kButtonContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kButtonContainerHeight,
              child: Center(
                child: Text(
                  'Calculate',
                  style: kLabelTextStyle.copyWith(
                      fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Result Page');
            },
          ),
        ],
      ),
    );
  }
}
