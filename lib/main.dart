import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: MaterialApp(
        initialRoute: 'Input Page',
        routes: {
          'Input Page': (context) => const InputPage(),
          'Result Page': (context) => const ResultPage(),
        },
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            color: Color(0xFF0A0E21),
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
        ),
      ),
    );
  }
}
