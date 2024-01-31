import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fuel_calc/calculations.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,

    required this.children,
  });

  final List<TableRow> children;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(10),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(10),
      },
      children: children,
    );
  }
}

TableRow resultRow(prefix, result, suffix) {
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
            Text(" " + suffix, style: style),
          ],
        )
      ],
    );
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
    required this.height,
    required this.hintText,
    required this.suffix,
    required this.controller,
  });

  final String hintText;
  final String suffix;

  final double height;
  final double width;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var fuelState = context.watch<FuelHandler>();

    return SizedBox(
      width: width,
      height: height*0.05,
      child: TextField(
        cursorColor: Colors.white10,
        cursorHeight: 0,
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
          filled: true,
          fillColor: Color(0x09FFFFF6),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "Iceland",
            fontSize: 32,
            color: Color(0xF0D2D2D2)
          ),
          suffix: Text(suffix),
        ),
        style: const TextStyle(
          fontFamily: "Iceland",
          fontSize: 32,
          color: Colors.white
        ),
        controller: controller,
        onChanged: (text) => {
          fuelState.notifyListeners()
        },
      ),
    );
  }
}
