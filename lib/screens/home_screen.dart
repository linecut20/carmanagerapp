import 'package:carmanagerapp/components/door_lock.dart';
import 'package:carmanagerapp/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../anim_controller.dart';
import '../constains.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final _animController = AnimController();

  late AnimationController _batteryAnimController;
  late Animation<double> _batteryAnimMotion;

  void setupBatterAnimFunc() {
    _batteryAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    _batteryAnimMotion = CurvedAnimation(
      parent: _batteryAnimController,
      curve: Interval(0.0, 0.5),
    );
  }


  @override
  void initState() {
    super.initState();
    setupBatterAnimFunc();
  }

  @override
  void dispose() {
    super.dispose();
    _batteryAnimController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([_animController, _batteryAnimController]),
        builder: (context, snapshot) {
          return Scaffold(
            body: LayoutBuilder(
                builder: (context, constrains) {
                  //Stack => child위젯을 겹쳐 포진하고자할 때 사용
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constrains.maxHeight * 0.1
                        ),
                        child:
                        //SafeArea => 적절히 패딩을 사용하여 child를 안전영역 안으로 포진시키는 위젯(★)
                        SafeArea(
                            child: SvgPicture.asset('icons/Car.svg',
                                width: double.infinity,
                                height: double.infinity
                            )),
                      ),

                      //운전석
                      //위젯중 Animated가 붙은 위젯이 존재 (애니메이셔닝을 지원하는 위젯 개념)
                      AnimatedPositioned(
                        duration: defaultDuration,
                        left: _animController.bottomNavIndex == 0
                            ? constrains.maxWidth * 0.075
                            : constrains.maxWidth / 2,
                        top: 325,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _animController.isLeftTopDoorLock,
                            press: _animController.changeLeftTopDoorState,
                          ),
                        )
                      ),

                      //조수석
                      AnimatedPositioned(
                        duration: defaultDuration,
                        right: _animController.bottomNavIndex == 0
                          ? constrains.maxWidth * 0.075
                          : constrains.maxWidth / 2,
                        top: 325,
                        child: AnimatedOpacity(
                          opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                          duration: defaultDuration,
                          child: DoorLock(
                            isLock: _animController.isRightTopDoorLock,
                            press: _animController.changeRightTopDoorState,
                          ),
                        )
                      ),

                      //운전석 뒷자석
                      AnimatedPositioned(
                        duration: defaultDuration,
                        left: _animController.bottomNavIndex == 0
                          ? constrains.maxWidth * 0.075
                          : constrains.maxWidth / 2,
                        bottom: 275,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _animController.isLeftBottomDoorLock,
                            press: _animController.changeLeftBottomDoorState,
                          ),
                        )
                      ),

                      //조수석 뒷자석
                      AnimatedPositioned(
                        duration: defaultDuration,
                        right: _animController.bottomNavIndex == 0
                          ? constrains.maxWidth * 0.075
                          : constrains.maxWidth / 2,
                        bottom: 275,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _animController.isRightBottomDoorLock,
                            press: _animController.changeRightBottomDoorState,
                          ),
                        )
                      ),

                      //보닛
                      AnimatedPositioned(
                        duration: defaultDuration,
                        top: _animController.bottomNavIndex == 0
                          ? constrains.maxHeight * 0.0325
                          : constrains.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _animController.isBonetLock,
                            press: _animController.changeBonetState,
                          ),
                        )
                      ),

                      //트렁크
                      AnimatedPositioned(
                        duration: defaultDuration,
                        bottom: _animController.bottomNavIndex == 0
                          ? constrains.maxHeight * 0.0325
                          : constrains.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                          child: DoorLock(
                            isLock: _animController.isTrunkLock,
                            press: _animController.changeTrunkState,
                          ),
                        )
                      ),

                      //배터리
                      Opacity(
                        // duration: defaultDuration,
                        // opacity: _animController.bottomNavIndex != 0 ? 1 : 0,
                        opacity: _batteryAnimController.value,
                        child: AnimatedPositioned(
                          duration: defaultDuration,
                          child: SvgPicture.asset('icons/Battery.svg',
                            width: constrains.maxWidth * 0.34,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('220 mi',
                            style: Theme.of(context).
                            textTheme.headline3!.
                            copyWith(color: Colors.white)),

                          Text('63%',
                            style: Theme.of(context).
                            textTheme.headline5!.
                            copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          Text('충전중',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),

                          Text('17분 남았습니다'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                          SizedBox(
                            height: constrains.maxHeight * 0.2,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('22mi/hr',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text('232v',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }
            ),

            bottomNavigationBar: HomeController(
              onTap: (index) {
                if (index == 1) {
                  _batteryAnimController.forward();
                } else if (_animController.bottomNavIndex == 1 && index != 1) {
                  _batteryAnimController.reverse();
                }

                _animController.onBottomNavTabChange(index);
              },
              selectedTab: _animController.bottomNavIndex,
            ),
          );
        }
    );
  }
}