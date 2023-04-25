import 'package:flutter/material.dart';
class GenderSelect extends StatelessWidget {
  GenderSelect({required this.icon,required this.tx});
  final IconData icon;
  final String tx;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          tx,
          style: TextStyle(fontSize: 18.0, color: Color(0xff8d8e98)),
        )
      ],
    );
  }
}
