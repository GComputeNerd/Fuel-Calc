import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            Container(
              height: height*0.04,
              margin: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'lib/icons/sedan.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            const Text(
              "Mileage",
              style: TextStyle(
                fontFamily: 'Iceland',
                fontSize: 40,
                color: Colors.white,
              ),),
            InputBox(
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
              width: width*0.8, 
              hintText: "Fuel", 
              suffix: "ltr"
            ),
            const SizedBox(height: 13,),
            InputBox(
              width: width*0.8, 
              hintText: "Speed", 
              suffix: "km/hr"
            )
          ],
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    required this.width,
    required this.hintText,
    required this.suffix
  });

  final String hintText;
  final String suffix;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        cursorColor: Colors.white10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Color(0xFF1B8A62),
              width: 2.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Color(0xAA8C7B91), width: 2.0),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 18),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "Iceland",
            fontSize: 20,
            color: Colors.white
          ),
          suffix: Text(suffix),
        ),
        style: const TextStyle(
          fontFamily: "Iceland",
          fontSize: 20,
          color: Colors.white
        ),
      ),
    );
  }
}
