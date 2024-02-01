import 'package:flutter/material.dart';

class FuelHandler extends ChangeNotifier {
  final mileageDistance = TextEditingController();
  final mileageFuel = TextEditingController();
  final avgSpeed = TextEditingController();
  final fuelLeft = TextEditingController();

  int currentMenu = 0;

  @override
  void dispose() {
    mileageDistance.dispose();
    mileageFuel.dispose();
    avgSpeed.dispose();
    fuelLeft.dispose();

    super.dispose();
  }

  String getRange() {
    var mdist  = mileageDistance.text.toString();
    var mfuel = mileageFuel.text.toString();
    var fuel = fuelLeft.text.toString();

    if (mdist.length * mfuel.length * fuel.length != 0) {
      num mileage = num.parse(mdist) / num.parse(mfuel);
      num range = num.parse(fuel) * mileage;

      return range.toString();
    } else {
      return "XXX";
    }
  }

  String getTimeLeft() {
    var rangeString = getRange();
    var speed = avgSpeed.text.toString();

    if (rangeString != "XXX" && speed.isNotEmpty) {
      num timeLeft = num.parse(rangeString) / num.parse(speed);
      return timeLeft.toString();
    } else {
      return "XXX";
    }
  }
}