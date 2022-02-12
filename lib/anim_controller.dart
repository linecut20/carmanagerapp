import 'package:flutter/material.dart';

class AnimController extends ChangeNotifier{
  var isRightTopDoorLock = true;
  var isLeftTopDoorLock = true;
  var isRightBottomDoorLock = true;
  var isLeftBottomDoorLock = true;
  var isBonnetLock = true;
  var isTrunkLock = true;
  var bottomNavIndex = 0;

  //===========================
  bool isCoolSelected = true;
  bool isHeatSelected = false;

  void onBottomNavTabChange(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }

  void changeRightTopDoorState() {
    isRightTopDoorLock = !isRightTopDoorLock;
    notifyListeners();
  }

  void changeLeftTopDoorState() {
    isLeftTopDoorLock = !isLeftTopDoorLock;
    notifyListeners();
  }

  void changeRightBottomDoorState() {
    isRightBottomDoorLock = !isRightBottomDoorLock;
    notifyListeners();
  }

  void changeLeftBottomDoorState() {
    isLeftBottomDoorLock = !isLeftBottomDoorLock;
    notifyListeners();
  }

  void changeBonnetState() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void changeTrunkState() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }

  void selectCoolFunc() {
    isCoolSelected = true;
    isHeatSelected = false;
    notifyListeners();
  }

  void selectHotFunc() {
    isCoolSelected = false;
    isHeatSelected = true;
    notifyListeners();
  }
}