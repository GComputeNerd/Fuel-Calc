import 'package:flutter/material.dart';
import 'package:fuel_calc/elements.dart';
import 'package:fuel_calc/calculations.dart';
import 'package:provider/provider.dart';

class SelectedMenu extends StatelessWidget {
  const SelectedMenu({
    super.key,
    required this.height,
    required this.width,
    required this.fuelState,
  });

  final double height;
  final double width;
  final FuelHandler fuelState;

  @override
  Widget build(BuildContext context) {
    int currentMenu = fuelState.currentMenu;

    if (currentMenu == 0){
      return RangeMenu(
        height: height,
        width: width,
        fuelState: fuelState);
    } else if (currentMenu == 1){
      return FuelMenu(
        height: height,
        width: width,
        fuelState: fuelState);
    } else {
      return CostMenu(
        height: height,
        width: width,
        fuelState: fuelState,
      );
    }
  }
}

class RangeMenu extends StatelessWidget {
  const RangeMenu({
    super.key,
    required this.height,
    required this.width,
    required this.fuelState,
  });

  final double height;
  final double width;
  final FuelHandler fuelState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Heading(
          height: height,
          imgPath: "lib/icons/range.png",
          title: "Range"
        ),
        InputBox(
          width: width,
          hintText: "Fuel in Tank",
          suffix: "ltr",
          controller: fuelState.fuelLeft,
        ),
        const SizedBox(height: 13,),
        InputBox(
          width: width, 
          hintText: "Avg. Speed", 
          suffix: "km/hr",
          controller: fuelState.avgSpeed,
        ),
        const SizedBox(height: 5,),
        Result(
          children: [
            resultRow("Range", fuelState.getRange(), "km", context),
            resultRow("Time Left", fuelState.getTimeLeft(), "hrs", context)
          ],
        ),
      ],
    );
  }
}

class FuelMenu extends StatelessWidget {
  const FuelMenu({
    super.key,
    required this.height,
    required this.width,
    required this.fuelState,
  });

  final double height;
  final double width;
  final FuelHandler fuelState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Heading(
          height: height,
          imgPath: 'lib/icons/fuel.png',
          title: 'Fuel'),
          InputBox(
            width: width,
            hintText: "Distance",
            suffix: "km",
            controller: fuelState.fuelDistanceController,
          ),
          const SizedBox(height: 5,),
          Result(
            children: [resultRow("Fuel Needed", fuelState.getFuelRequired(), "ltr", context)]
          )
      ],
    );
  }
}

class CostMenu extends StatelessWidget {
  const CostMenu({
    super.key,
    required this.height,
    required this.width,
    required this.fuelState,
  });

  final double height;
  final double width;
  final FuelHandler fuelState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Heading(
          height: height,
          imgPath: 'lib/icons/money.png',
          title: 'Cost'),
          InputBox(
            width: width,
            hintText: "Distance",
            suffix: "km",
            controller: fuelState.fuelDistanceController,
          ),
          const SizedBox(height: 13,),
          InputBox(
            width: width,
            hintText: "Fuel Rate",
            suffix: "Rs/ltr",
            controller: fuelState.costRateController,
          ),
          const SizedBox(height: 5,),
          Result(
            children: [resultRow("Trip Cost", fuelState.getTripCost(), "Rs", context)]
          )
      ],
    );
  }
}