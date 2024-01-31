import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              SizedBox(height: 30,),
              Heading(
                height: height*0.04,
                imgPath: "lib/icons/sedan.png",
                title: "Mileage",
              ),
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
              ),
              Container(
                width: width*0.82,
                height: height*0.007,
                margin: EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  color: Color(0xFF404040),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              Heading(
                height: height*0.06,
                imgPath: "lib/icons/range.png",
                title: "Range"
              ),
              InputBox(
                width: width*0.8,
                hintText: "Fuel in Tank",
                suffix: "ltr"
              ),
              const SizedBox(height: 5,),
              Result(
                children: [
                  ResultRow("Range", "XXX", "km"),
                  ResultRow("Time Left", "XXX", "hrs")
                ],
              )
            ],
          )]
        ),
      ),
    );
  }
}

TableRow ResultRow(prefix, result, suffix) {
    TextStyle style = const TextStyle(
        fontFamily: "Iceland",
        fontSize: 32,
        color: Colors.white
      );

    return TableRow(
      children: [
        Text(prefix,
        style: style,
        textAlign: TextAlign.right,),
        Text(":",
        style: style,
        textAlign: TextAlign.center,),
        Row(
          children: [
            Text(result, style: const TextStyle(
              fontFamily: "Iceland",
            fontSize: 32,
            color: Color(0xFF41CD70)
            )),
            Text(suffix, style: style),
          ],
        )
      ],
    );
}

class Result extends StatelessWidget {
  const Result({
    super.key,

    required this.children,
  });

  final List<TableRow> children;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Table(
      columnWidths: {
        0: FlexColumnWidth(10),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(10),
      },
      children: children,
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.height,
    required this.imgPath,
    required this.title,
  });

  final String imgPath;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
          child: Image.asset(
            imgPath,
            fit: BoxFit.fitHeight,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Iceland',
            fontSize: 40,
            color: Colors.white,
          ),),
      ],
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
