import 'package:flutter/material.dart';

class UniversalBox extends StatelessWidget {
  UniversalBox({required this.colour, required this.boxChild,});
  final Color colour;
  final Widget boxChild;
 
  // UniversalBox({Color? colour});
  //  late Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: boxChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),);
  }
}
