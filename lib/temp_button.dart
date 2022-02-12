import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constains.dart';

class TempButton extends StatelessWidget {
  var isActive;
  String imgSrc;
  String btnString;
  var btnColor;

  TempButton({
    required this.imgSrc,
    required this.btnString,
    required this.btnColor,
    required this.isActive,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: defaultDuration,
          curve: Curves.easeInOutBack,
          width: isActive ? 75 : 50,
          height: isActive ? 75 : 50,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SvgPicture.asset(imgSrc,
            color: isActive ? btnColor : Colors.white38
          )
        ),

        SizedBox(
          height: defaultPadding / 2,
        ),

        AnimatedDefaultTextStyle(
          duration: defaultDuration,
          style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? btnColor : Colors.white38
          ),
          child: Text(btnString),
        )
      ]
    );
  }
}
