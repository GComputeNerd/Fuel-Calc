import 'package:flutter/material.dart';
import 'package:fuel_calc/calculations.dart';
import 'package:provider/provider.dart';
import 'package:fuel_calc/elements.dart';
import 'package:fuel_calc/fuel_sections.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
      create: (context) => FuelHandler(),
      child: const MyHomePage(),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var fuelState = context.watch<FuelHandler>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF263238),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) => const TextStyle(color: Colors.white)
          ),
        ),
        child: NavigationBar(
          backgroundColor: Color(0xFF263238),
          indicatorColor: Color(0xFF37474F),
          onDestinationSelected: (int index) {
            setState(() {
              fuelState.currentMenu = index;
            });
          },
          selectedIndex: fuelState.currentMenu,
          destinations: const <Widget>[
            NavigationDestination(
              icon: ImageIcon(
                AssetImage('lib/icons/distance.png'),
                color: Colors.white,),
              label: "Range",
            ),
            NavigationDestination(
              icon: ImageIcon(
                AssetImage('lib/icons/fuel.png'),
                color: Colors.white,),
              label: "Fuel"
            )
          ],
        ),
      ),
      body: Center(
        child: ListView( 
          children: [Column(
            children: [
              SizedBox(height: height*0.05,),
              Heading(
                height: height*0.04,
                imgPath: "lib/icons/sedan.png",
                title: "Mileage",
              ),
              InputBox(
                width: width*0.8,
                hintText: "Distance",
                suffix: "km",
                controller: fuelState.mileageDistance,
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
                suffix: "ltr",
                controller: fuelState.mileageFuel,
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
              SelectedMenu(
                height: height*0.06, 
                width: width*0.8, 
                fuelState: fuelState
              )
            ],
          )]
        ),
      ),
    );
  }
}