import 'dart:developer';

import 'package:bmi_calculator_flutter/card_content.dart';
import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  int heightOfTheUser = 180;

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
                        heightOfTheUser.toString(),
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
                      thumbColor: const Color(0xFFEB1555),
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
                          heightOfTheUser = value.round();
                          // log(value.toString());
                        });
                      },
                      value: heightOfTheUser.toDouble(),
                      inactiveColor: const Color(0xFF8E8D98),
                      min: 120.0,
                      max: 250.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: kActiveCardsColor),
                ),
                Expanded(
                  child: ReusableCard(color: kActiveCardsColor),
                ),
              ],
            ),
          ),
          Container(
            color: kButtonContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kButtonContainerHeight,
          ),
        ],
      ),
    );
  }
}
