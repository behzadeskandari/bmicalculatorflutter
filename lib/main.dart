import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff0a0e21),
          ),
          scaffoldBackgroundColor: Color(0xff0a0e21),
          //  accentColor not working on this themeData
          // accentColor: Colors.purple
          textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xFFFFFFFF)))),
      home: const InputPage(),
    );
  }
}
