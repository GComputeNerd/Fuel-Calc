import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FuelHandler extends ChangeNotifier {
  final mileageDistance = TextEditingController();
  final mileageFuel = TextEditingController();
  final avgSpeed = TextEditingController();
  final fuelLeft = TextEditingController();
  @override
  void dispose() {
    mileageDistance.dispose();
    mileageFuel.dispose();
    avgSpeed.dispose();
    fuelLeft.dispose();

    super.dispose();
  }

  String getRange() {
    var text  = mileageDistance.text.toString();
    var mfuel = mileageFuel.text.toString();
    var fuel = fuelLeft.text.toString();

    if (text != "") {
      return text;
    } else {
      return "XXX";
    }
  }
}