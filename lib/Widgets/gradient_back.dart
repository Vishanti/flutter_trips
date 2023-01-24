import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";
  double? height;

  GradientBack({super.key, required this.height}); //height = null full screen

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      // alignment: const Alignment(-0.9, -0.6),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: const Alignment(-1.5, -0.8),
        child: Container(
          height: height ?? screenHeight,
          width: screenHeight,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(screenHeight / 2),
          ),
        ),
      ),
      // child: Text(
      //   title,
      //   style: const TextStyle(
      //       color: Colors.white,
      //       fontSize: 30.0,
      //       fontFamily: "Lato",
      //       fontWeight: FontWeight.bold),
      // ),
    );
  }
}
