import 'package:carmanagerapp/battery_status.dart';
import 'package:carmanagerapp/components/door_lock.dart';
import 'package:carmanagerapp/home_controller.dart';
import 'package:carmanagerapp/model/TyrePsi.dart';
import 'package:carmanagerapp/temp_button.dart';
import 'package:carmanagerapp/tyre_psi_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../anim_controller.dart';
import '../constains.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _animController = AnimController();

  late AnimationController _batteryAnimController;
  late Animation<double> _batteryAnimMotion;
  late Animation<double> _batteryStatusMotion;
  //===========================================

  late AnimationController _tempAnimController;
  late Animation<double> _tempInfoMotion;
  late Animation<double> _tempImgMotion;
  //===========================================

  late AnimationController _tyreAnimController;
  late Animation<double> _tyreAnimMotion;

  int temp = 20;

  void setupTyreAnimFunc() {
    _tyreAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );

    _tyreAnimMotion = CurvedAnimation(
      parent: _tyreAnimController,
      curve: Interval(0.0, 0.4)
    );
  }

  void setupTempAnimFunc() {
    _tempAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800)
    );

    _tempInfoMotion = CurvedAnimation(
      parent: _tempAnimController,
      curve: Interval(0.7, 1)
    );

    _tempImgMotion = CurvedAnimation(
      parent: _tempAnimController,
      curve: Interval(0.75, 1)
    );
  }

  void setupBatterAnimFunc() {
    _batteryAnimController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    _batteryAnimMotion = CurvedAnimation(
      parent: _batteryAnimController,
      curve: Interval(0.0, 0.5),
    );

    _batteryStatusMotion = CurvedAnimation(
      parent: _batteryAnimController,
      curve: Interval(0.6, 1)
    );
  }


  @override
  void initState() {
    super.initState();
    setupBatterAnimFunc();
    setupTempAnimFunc();
    setupTyreAnimFunc();
  }

  @override
  void dispose() {
    super.dispose();
    _batteryAnimController.dispose();
    _tempAnimController.dispose();
    _tyreAnimController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //적용할 애니메이션 컨트롤러 관장구간
      animation: Listenable.merge([_animController, _batteryAnimController, _tempAnimController, _tyreAnimController]),
      builder: (context, snapshot) {
        return Scaffold(
          body: LayoutBuilder(
              builder: (context, constrains) {
                //Stack => child위젯을 겹쳐 포진하고자할 때 사용
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: constrains.maxWidth,
                  height: constrains.maxHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      //차량도면
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        left: constrains.maxWidth / 2 * _tempAnimController.value,
                        width: constrains.maxWidth,
                        height: constrains.maxHeight,
                        child: Padding(
                          padding: EdgeInsets.all(70),
                          child: SvgPicture.asset('assets/icons/Car.svg',
                            width: double.infinity,
                          ),
                        ),
                      ),

                      //운전석
                      Visibility(
                        visible: _animController.bottomNavIndex == 0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            //위젯중 Animated가 붙은 위젯이 존재 (애니메이셔닝을 지원하는 위젯 개념)
                            AnimatedPositioned(
                                duration: defaultDuration,
                                left: _animController.bottomNavIndex == 0
                                    ? constrains.maxWidth * 0.15
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
                                    ? constrains.maxWidth * 0.15
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
                                    ? constrains.maxWidth * 0.15
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
                                    ? constrains.maxWidth * 0.15
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

                            //본넷
                            AnimatedPositioned(
                                duration: defaultDuration,
                                top: _animController.bottomNavIndex == 0
                                    ? constrains.maxHeight * 0.2
                                    : constrains.maxHeight / 3,
                                child: AnimatedOpacity(
                                  duration: defaultDuration,
                                  opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                                  child: DoorLock(
                                    isLock: _animController.isBonnetLock,
                                    press: _animController.changeBonnetState,
                                  ),
                                )
                            ),

                            //트렁크
                            AnimatedPositioned(
                                duration: defaultDuration,
                                bottom: _animController.bottomNavIndex == 0
                                    ? constrains.maxHeight * 0.2
                                    : constrains.maxHeight / 3,
                                child: AnimatedOpacity(
                                  duration: defaultDuration,
                                  opacity: _animController.bottomNavIndex == 0 ? 1 : 0,
                                  child: DoorLock(
                                    isLock: _animController.isTrunkLock,
                                    press: _animController.changeTrunkState,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),

                      //배터리
                      Positioned(
                        child: Opacity(
                          opacity: _batteryAnimMotion.value,
                          child: SvgPicture.asset('assets/icons/battery.svg',
                            width: constrains.maxWidth * 0.34,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 20 * (1 - _batteryStatusMotion.value),
                        width: constrains.maxWidth,
                        height: constrains.maxHeight * 0.9,
                        child: Opacity(
                            opacity: _batteryStatusMotion.value,
                            child: BatteryStatus()
                        ),
                      ),

                      //temp
                      Visibility(
                        visible: _animController.bottomNavIndex == 2,
                        child: Stack(
                          children: [
                            Positioned(
                              width: constrains.maxWidth,
                              height: constrains.maxHeight,
                              top: 20 * (1 - _tempInfoMotion.value),
                              child: Opacity(
                                opacity: _tempInfoMotion.value,
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 135,
                                        child: Row(
                                            children: [
                                              //cool button
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    temp = 20;
                                                  });
                                                  _animController.selectCoolFunc();
                                                },
                                                child: TempButton(
                                                  isActive: _animController.isCoolSelected,
                                                  btnString: 'COOL',
                                                  imgSrc: 'assets/icons/coolShape.svg',
                                                  btnColor: primaryColor,
                                                ),
                                              ),

                                              SizedBox(
                                                width: defaultPadding,
                                              ),

                                              //heat button
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    temp = 27;
                                                  });
                                                  _animController.selectHotFunc();
                                                },
                                                child: TempButton(
                                                  isActive: _animController.isHeatSelected,
                                                  btnString: 'HEAT',
                                                  imgSrc: 'assets/icons/heatShape.svg',
                                                  btnColor: redColor,
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),

                                      Spacer(),

                                      Column(
                                        children: [
                                          IconButton(onPressed: () {
                                            setState(() {
                                              if (temp < 32) {
                                                temp++;
                                              }
                                            });
                                          }, icon: Icon(Icons.arrow_drop_up_outlined, color: Colors.white, size: 40), padding: EdgeInsets.zero,),
                                          Text("$temp \u2103", style: TextStyle(fontSize: 80),),
                                          IconButton(onPressed: () {
                                            setState(() {
                                              if (temp > 18) {
                                                temp--;
                                              }
                                            });
                                          }, icon: Icon(Icons.arrow_drop_down_outlined, color: Colors.white, size: 40), padding: EdgeInsets.zero,),
                                        ],
                                      ),
                                      Spacer(),

                                      Text('현재온도', style: TextStyle(fontSize: 20),),
                                      SizedBox(height: defaultPadding),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text('내부온도'),
                                              Text('20 ℃', style: Theme.of(context).textTheme.headline5,)
                                            ],
                                          ),
                                          SizedBox(
                                            width: defaultPadding,
                                          ),
                                          Column(
                                            children: [
                                              Text('외부온도', style: TextStyle(color: Colors.white54),),
                                              Text('35 ℃', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white54),)
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              right: -120 * (1 - _tempImgMotion.value),
                              child: Opacity(
                                opacity: _tempInfoMotion.value,
                                child: AnimatedSwitcher(
                                  duration: defaultDuration,
                                  child: _animController.isCoolSelected
                                      ? Image.asset('assets/images/Cool_glow_2.png', key: UniqueKey())
                                      : Image.asset('assets/images/Hot_glow_4.png', key: UniqueKey()),
                                ),
                              ),
                              width: 200,
                            )
                          ],
                        ),
                      ),

                      //tyre
                      //좌상단
                      Visibility(
                        visible: _animController.bottomNavIndex == 3,
                        child: Stack(
                          children: [
                            Positioned(
                              left: constrains.maxWidth * 0.2,
                              top: constrains.maxHeight * 0.2,
                              child: Opacity(
                                  opacity: _tyreAnimMotion.value,
                                  child: SvgPicture.asset('assets/icons/FL_Tyre.svg')
                              ),
                            ),

                            //우상단
                            Positioned(
                              right: constrains.maxWidth * 0.2,
                              top: constrains.maxHeight * 0.2,
                              child: Opacity(
                                  opacity: _tyreAnimMotion.value,
                                  child: SvgPicture.asset('assets/icons/FL_Tyre.svg')
                              ),
                            ),

                            //좌하단
                            Positioned(
                              left: constrains.maxWidth * 0.2,
                              bottom: constrains.maxHeight * 0.175,
                              child: Opacity(
                                  opacity: _tyreAnimMotion.value,
                                  child: SvgPicture.asset('assets/icons/FL_Tyre.svg')
                              ),
                            ),

                            //우하단
                            Positioned(
                              right: constrains.maxWidth * 0.2,
                              bottom: constrains.maxHeight * 0.175,
                              child: Opacity(
                                  opacity: _tyreAnimMotion.value,
                                  child: SvgPicture.asset('assets/icons/FL_Tyre.svg')
                              ),
                            ),

                            Opacity(
                              opacity: _tyreAnimMotion.value,
                              child: Padding(
                                padding: EdgeInsets.all(defaultPadding),
                                child: GridView.builder(
                                    itemCount: 4,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: defaultPadding,
                                        crossAxisSpacing: defaultPadding,
                                        childAspectRatio: constrains.maxWidth / constrains.maxHeight
                                    ),
                                    itemBuilder: (context, index) => TyrePsiCard(tyrePsi: demoPsiList[index])
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),

          bottomNavigationBar: HomeController(
            onTap: (index) {
              if (index == 1) {
                _batteryAnimController.forward();
              } else if (_animController.bottomNavIndex == 1 && index != 1) {
                _batteryAnimController.reverse(from: 0.7);
              }

              if (index == 2) {
                _tempAnimController.forward();
              } else if (_animController.bottomNavIndex == 2 && index != 2) {
                _tempAnimController.reverse(from: 0.3);
              }

              if (index == 3) {
                _tyreAnimController.forward();
              } else if (_animController.bottomNavIndex == 3 && index != 3) {
                _tyreAnimController.reverse(from: 0.7);
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