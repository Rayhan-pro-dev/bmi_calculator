import 'package:bmi_calculator/calculator.dart';

import 'screen.dart';
import 'package:flutter/material.dart';
import 'BOX.dart';
import 'Gender_Select.dart';
import 'constants.dart';

enum gender { male, female }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int weight = 60;
  int age = 24;
  dynamic selectedgender;
  int slider_value = 180;

  // Color maleboxcolor = inactiveboxColor;
  // Color femaleboxcolor = inactiveboxColor;
  // void updatecolor(gender selectedgender) {
  //   if (selectedgender == gender.male) {
  //     if (maleboxcolor == inactiveboxColor) {
  //       maleboxcolor = activeboxColor;
  //       femaleboxcolor = inactiveboxColor;
  //     } else {
  //       maleboxcolor = inactiveboxColor;
  //     }
  //   }
  //   if (selectedgender == gender.female) {
  //     if (femaleboxcolor == inactiveboxColor) {
  //       femaleboxcolor = activeboxColor;
  //       maleboxcolor = inactiveboxColor;
  //     } else {
  //       femaleboxcolor = inactiveboxColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = gender.male;
                      });
                    },
                    child: UniversalBox(
                        colour: selectedgender == gender.male
                            ? activeboxColor
                            : inactiveboxColor,
                        boxChild: GenderSelect(
                          icon: Icons.male,
                          tx: "MALE",
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = gender.female;
                      });
                    },
                    child: UniversalBox(
                      colour: selectedgender == gender.female
                          ? activeboxColor
                          : inactiveboxColor,
                      boxChild: GenderSelect(
                        icon: Icons.female,
                        tx: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 2nd section
          Expanded(
            flex: 1,
            child: UniversalBox(
              colour: activeboxColor,
              boxChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: smallfontstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        slider_value.toString(),
                        style: bigfontstyle,
                      ),
                      Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context)
                        .copyWith(activeTickMarkColor: Colors.black),
                    child: Slider(
                      value: slider_value.toDouble(),
                      activeColor: Colors.pinkAccent,
                      inactiveColor: Colors.white38,
                      min: 120,
                      max: 220,
                      onChanged: (double newvalue) {
                        setState(() {
                          slider_value = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          //3rd section

          Expanded(
            child: Row(
              children: [
                // weight defination
                Expanded(
                  child: UniversalBox(
                    colour: activeboxColor,
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: smallfontstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: bigfontstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // age defination
                Expanded(
                  child: UniversalBox(
                    colour: activeboxColor,
                    boxChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: smallfontstyle,
                        ),
                        Text(
                          age.toString(),
                          style: bigfontstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xff4c4f5e),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Class1(
                              icon: Icons.remove,
                              onpres: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 4th section

          TextButton(
            child: Container(
              child: Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 30, color: Colors.white54),
                ),
              ),
              height: botomcontainerheight,
              color: Color(0xffeb1555),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
            ),
            onPressed: () {
              // calling method like java
              // Calculatepage objectname=new Calculatepage(//weight: weight, slider_value: slider_value);
              // objectame.MathodName()

              Calculatepage calc =
                  Calculatepage(weight: weight, slider_value: slider_value);

              setState(() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Screen(
                      bmi: calc.bmi_Result(),
                      textResult: calc.getResult(),
                      instruction: calc.getInterpretation(),
                    );
                  },
                ));
              });
            },
          )
        ],
      ),
    );
  }
}


class Class1 extends StatelessWidget {
  const Class1({required this.icon, this.onpres});
  final IconData icon;
  final onpres;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xff4c4f5e),
      onPressed: onpres,
      child: Icon(
        icon,
        size: 40,
      ),
    );
  }
}
