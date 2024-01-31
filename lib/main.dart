import 'package:flutter/material.dart';
import 'package:fuel_calc/elements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF263238),
      body: Center(
        child: ListView( 
          children: [Column(
            children: [
              Heading(
                height: height*0.04,
                imgPath: "lib/icons/sedan.png",
                title: "Mileage",
              ),
              InputBox(
                height: height,
                width: width*0.8,
                hintText: "Distance",
                suffix: "km",
              ),
              const SizedBox(height: 5,),
              const Text(
                "per",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19
                ),
              ),
              const SizedBox(height: 5,),
              InputBox(
                height: height,
                width: width*0.8, 
                hintText: "Fuel", 
                suffix: "ltr"
              ),
              const SizedBox(height: 13,),
              InputBox(
                height: height,
                width: width*0.8, 
                hintText: "Speed", 
                suffix: "km/hr"
              ),
              Container(
                width: width*0.82,
                height: height*0.007,
                margin: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  color: const Color(0xFF404040),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              Heading(
                height: height*0.06,
                imgPath: "lib/icons/range.png",
                title: "Range"
              ),
              InputBox(
                height: height,
                width: width*0.8,
                hintText: "Fuel in Tank",
                suffix: "ltr"
              ),
              const SizedBox(height: 5,),
              Result(
                children: [
                  resultRow("Range", "XXX", "km"),
                  resultRow("Time Left", "XXX", "hrs")
                ],
              )
            ],
          )]
        ),
      ),
    );
  }
}