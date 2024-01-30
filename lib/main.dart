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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF263238),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'lib/icons/sedan.png',
                fit: BoxFit.fitHeight,
              ),
              height: 40,
              margin: EdgeInsets.only(top: 40),
            ),
            Text(
              "Mileage",
              style: TextStyle(
                fontFamily: 'Iceland',
                fontSize: 52,
                color: Colors.white,
              ),),
          ],
        ),
      ),
    );
  }
}
