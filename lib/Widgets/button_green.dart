import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double border;

  ButtonGreen(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.border});

  @override
  State<ButtonGreen> createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.border),
            gradient: const LinearGradient(
                colors: [
                  Color(0xFFa7ff84), //arriba
                  Color(0xFF1cbb78)
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
