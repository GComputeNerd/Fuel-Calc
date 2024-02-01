import 'package:flutter/material.dart';

class FuelHandler extends ChangeNotifier {
  final mileageDistance = TextEditingController();
  final mileageFuel = TextEditingController();
  final avgSpeed = TextEditingController();
  final fuelLeft = TextEditingController();

  final fuelDistanceController = TextEditingController();

  int currentMenu = 0;

  @override
  void dispose() {
    mileageDistance.dispose();
    mileageFuel.dispose();
    avgSpeed.dispose();
    fuelLeft.dispose();
    fuelDistanceController.dispose();

    super.dispose();
  }

  String getMileage() {
    var dist = mileageDistance.text.toString();
    var fuel = mileageFuel.text.toString();

    if (dist.length * fuel.length != 0) {
      return (num.parse(dist) / num.parse(fuel)).toString();
    } else {
      return "XXX";
    }
  }

  String getRange() {
    var fuel = fuelLeft.text.toString();
    var mileage = getMileage();

    if ( mileage != "XXX" && fuel.isNotEmpty) {
      num range = num.parse(fuel) * num.parse(mileage);

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

  String getFuelRequired() {
    var mileage = getMileage();
    var distance = fuelDistanceController.text.toString();

    if (mileage != "XXX" && distance.isNotEmpty) {
      return (num.parse(distance) / num.parse(mileage)).toString();
    } else {
      return "XXX";
    }
  }
}