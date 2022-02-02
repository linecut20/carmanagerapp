import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './constains.dart';

class HomeController extends StatelessWidget {
  HomeController({
    required this.selectedTab,
    required this.onTap,
    Key? key}) : super(key: key);

  var selectedTab;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      //items 내부에 코드로 열거하는 것 외에도 List.generate를 통해 생성 가능
      items: List.generate(navIconsSrc.length, (index) =>
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            navIconsSrc[index],
            color: index == selectedTab ? primaryColor : Colors.white54,
          ),
          label: "",
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