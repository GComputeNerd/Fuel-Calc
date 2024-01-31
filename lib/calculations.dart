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

    if (text.length * mfuel.length * fuel.length != 0) {
      num mileage = num.parse(text) / num.parse(mfuel);
      num range = num.parse(fuel) * mileage;

      return range.toString();
    } else {
      return "XXX";
    }
  }
}