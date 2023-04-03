import 'package:flutter/material.dart';

import './constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required required this.buttonTitle, required this.onTap});

  final void Function()? onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle.toString(),
          style: kLargeButtonTextStyle,
        ),
        padding: EdgeInsets.all(20.0),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHieght,
      ),
    );
  }
}
