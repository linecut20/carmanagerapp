import 'package:flutter/material.dart';

class AnimController extends ChangeNotifier{
  var isRightTopDoorLock = true;
  var isLeftTopDoorLock = true;
  var isRightBottomDoorLock = true;
  var isLeftBottomDoorLock = true;
  var isBonetLock = true;
  var isTrunkLock = true;
  var bottomNavIndex = 0;

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

  void changeBonetState() {
    isBonetLock = !isBonetLock;
    notifyListeners();
  }

  void changeTrunkState() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }
}