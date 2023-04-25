import 'user_interface.dart';


import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Screen({this.bmi, this.textResult, this.instruction});

  final bmi;
  final textResult;
  final instruction;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff1d1e33),
          appBarTheme: AppBarTheme(
           backgroundColor: Color(0xff1d1e33),
          )),
      home: Scaffold(
        appBar: AppBar(
          
          title: Text("Your Result",style: TextStyle(color: Colors.white,fontSize: 40),),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 28, 29, 34),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 
                  children: [
                    Text(textResult, style: font),
                    
                    gap,
                    Text(
                      bmi,
                      style: TextStyle(color: Colors.white54,fontSize: 75),
                    ),gap,
                    Text(instruction, style: font,textAlign: TextAlign.center,),
                    
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.pink,
                ),
                height: 80,
                child: Center(
                  child: Text(
                    "Recalculate",
                    style: font,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const font = TextStyle(
  fontSize: 30,
  color: Colors.white70,
);
const gap = SizedBox(
  height: 60,
);
