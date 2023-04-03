import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required required this.onPress, required this.icon});

  // const RoundIconButton({Key? key}) : super(key: key);
  final void Function()? onPress;
  final IconData icon;
  // Map<dynamic, dynamic> _updateOnPress() => {};
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPress,
      elevation: 0.0,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
