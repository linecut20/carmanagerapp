import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../constains.dart';

class DoorLock extends StatelessWidget{
  const DoorLock({required this.press, required this.isLock, Key? key}) : super(key: key);
  final bool isLock;
  final VoidCallback press; //콜백함수등을 파라미터로 사용하고자 할 경우 사용

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: AnimatedSwitcher(
          //애니메이션 커브 방향과 transitionBuilder 재정의를 통해
          //애니메이션 정의
          switchInCurve: Curves.easeInOutBack,
          transitionBuilder: (child, animation) =>
              ScaleTransition(
                scale: animation,
                child: child,
              ),
          duration: defaultDuration,
          //key를 사용해 별개로 지정하지 않는 경우
          //flutter는 같은 위젯으로 인식 => 애니메이션 사용x
          child: isLock
              ? SvgPicture.asset('icons/door_lock.svg', key: ValueKey('lock'))
              : SvgPicture.asset('icons/door_unlock.svg', key: ValueKey('unlock')),
        )
    );
  }
}