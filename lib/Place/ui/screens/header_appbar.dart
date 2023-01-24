import 'package:flutter/material.dart';
import '../../../Widgets/gradient_back.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[GradientBack(height: 250.0), const CardImageList()],
    );
  }
}
