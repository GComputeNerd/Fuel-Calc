import 'package:flutter/material.dart';

class FuelHandler extends ChangeNotifier {
  final mileageDistanceController = TextEditingController();
  final mileageFuelController = TextEditingController();
  final avgSpeedController = TextEditingController();
  final fuelLeftController = TextEditingController();

  final fuelDistanceController = TextEditingController();
  final costRateController = TextEditingController();

  int currentMenu = 0;

  @override
  void dispose() {
    mileageDistanceController.dispose();
    mileageFuelController.dispose();
    avgSpeedController.dispose();
    fuelLeftController.dispose();
    fuelDistanceController.dispose();
    costRateController.dispose();

    super.dispose();
  }

  bool showClearButton(BuildContext context) {
    var isKeyboardActive = MediaQuery.of(context).viewInsets.bottom != 0.0;

    if (isKeyboardActive) {
      return false;
    }

    int count = 0;

    if (mileageDistanceController.text.isEmpty && mileageFuelController.text.isEmpty) {
      count++;
    }

    if (avgSpeedController.text.isEmpty && fuelLeftController.text.isEmpty) {
      count++;
    }

    if (fuelDistanceController.text.isEmpty && costRateController.text.isEmpty) {
      count++;
    }

    return count == 3 ? false : true;
  }

  void resetControllers() {
    mileageDistanceController.clear();
    mileageFuelController.clear();
    avgSpeedController.clear();
    fuelLeftController.clear();
    fuelDistanceController.clear();
    costRateController.clear();

    notifyListeners();
  }

  String getMileage() {
    var dist = mileageDistanceController.text.toString();
    var fuel = mileageFuelController.text.toString();

    if (dist.length * fuel.length != 0) {
      return (num.parse(dist) / num.parse(fuel)).toString();
    } else {
      return "XXX";
    }
  }

  String getRange() {
    var fuel = fuelLeftController.text.toString();
    var mileage = getMileage();

    if ( mileage != "XXX" && fuel.isNotEmpty) {
      num range = num.parse(fuel) * num.parse(mileage);

      return range.toStringAsFixed(2);
    } else {
      return "XXX";
    }
  }

  String getTimeLeft() {
    var rangeString = getRange();
    var speed = avgSpeedController.text.toString();

    if (rangeString != "XXX" && speed.isNotEmpty) {
      num timeLeft = num.parse(rangeString) / num.parse(speed);
      return timeLeft.toStringAsFixed(2);
    } else {
      return "XXX";
    }
  }

  String getFuelRequired() {
    var mileage = getMileage();
    var distance = fuelDistanceController.text.toString();

    if (mileage != "XXX" && distance.isNotEmpty) {
      return (num.parse(distance) / num.parse(mileage)).toStringAsFixed(2);
    } else {
      return "XXX";
    }
  }

  String getTripCost() {
    var mileage = getMileage();
    var distance = fuelDistanceController.text.toString();
    var fuelRate = costRateController.text.toString();

    if (mileage != "XXX" && distance.length * fuelRate.length != 0) {
      num distanceRate = num.parse(fuelRate) / num.parse(mileage);

      return (num.parse(distance) * distanceRate).toStringAsFixed(2);
    } else {
      return "XXX";
    }
  }

  void updateHandler() {
    notifyListeners();
  }
}