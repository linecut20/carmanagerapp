import 'package:carmanagerapp/components/door_lock.dart';
import 'package:carmanagerapp/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../anim_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _animController = AnimController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animController,
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
                      Positioned(
                          left: constrains.maxWidth * 0.075,
                          top: 325,
                          child: DoorLock(
                            isLock: _animController.isLeftTopDoorLock,
                            press: _animController.changeLeftTopDoorState,
                          )
                      ),

                      //조수석
                      Positioned(
                          right: constrains.maxWidth * 0.075,
                          top: 325,
                          child: DoorLock(
                            isLock: _animController.isRightTopDoorLock,
                            press: _animController.changeRightTopDoorState,
                          )
                      ),

                      //운전석 뒷자석
                      Positioned(
                          left: constrains.maxWidth * 0.075,
                          bottom: 275,
                          child: DoorLock(
                            isLock: _animController.isLeftBottomDoorLock,
                            press: _animController.changeLeftBottomDoorState,
                          )
                      ),

                      //조수석 뒷자석
                      Positioned(
                          right: constrains.maxWidth * 0.075,
                          bottom: 275,
                          child: DoorLock(
                            isLock: _animController.isRightBottomDoorLock,
                            press: _animController.changeRightBottomDoorState,
                          )
                      ),

                      //보닛
                      Positioned(
                          top: constrains.maxHeight * 0.0325,
                          child: DoorLock(
                            isLock: _animController.isBonetLock,
                            press: _animController.changeBonetState,
                          )
                      ),

                      //트렁크
                      Positioned(
                          bottom: constrains.maxHeight * 0.0325,
                          child: DoorLock(
                            isLock: _animController.isTrunkLock,
                            press: _animController.changeTrunkState,
                          )
                      )
                    ],
                  );
                }
            ),

            bottomNavigationBar: HomeController(),
          );
        }
    );
  }
}