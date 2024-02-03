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
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(10),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(10),
      },
      children: children,
    );
  }
}

TableRow resultRow(prefix, result, suffix, context) {
    TextStyle style = const TextStyle(
        fontFamily: "Iceland",
        fontSize: 32,
        height: 1,
        color: Colors.white
      );

    var width = MediaQuery.of(context).size.width;

    return TableRow(
      children: [
        Container(
          width: width*0.01,
          margin: EdgeInsets.only(left: width*0.08),
          child: Text(prefix,
          style: style,
          textAlign: TextAlign.right,),
        ),
        Text(":",
        style: style,
        textAlign: TextAlign.center,),
        Container(
          width: width*0.01,
          margin: EdgeInsets.only(right: width*0.08),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: result,
                  style: const TextStyle(
                    fontFamily: "Iceland",
                    fontSize: 32,
                    color: Color(0xFF41CD70)
                )),
                TextSpan(
                  text: " " + suffix,
                  style: style),
              ],
            ),
          ),
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
    required this.hintText,
    required this.suffix,
    required this.controller,
  });

  final String hintText;
  final String suffix;
  final double width;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var fuelState = context.watch<FuelHandler>();

    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      child: TextField(
        cursorColor: Color(0xAAFFFFFF),
        keyboardType: TextInputType.number,
        showCursor: fuelState.showCursor(controller),
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
        style: TextStyle(
          fontFamily: "Iceland",
          fontSize: 32,
          height: height*0.0008,
          color: Colors.white,
        ),
        controller: controller,
        onChanged: (text) => {
          fuelState.updateHandler()
        },
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
