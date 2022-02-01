import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeController extends StatelessWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      //items 내부에 코드로 열거하는 것 외에도 List.generate를 통해 생성 가능
      items: List.generate(navIconsSrc.length, (index) =>
        BottomNavigationBarItem(
          icon: SvgPicture.asset(navIconsSrc[index]),
          label: ""
        )
      ),
    );
  }
}

List<String> navIconsSrc = [
  'icons/Lock.svg',
  'icons/Charge.svg',
  'icons/Temp.svg',
  'icons/Tyre.svg'
];