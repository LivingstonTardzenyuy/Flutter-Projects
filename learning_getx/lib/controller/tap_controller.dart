import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TapController extends GetxController{

  int _x = 0;
  int get x => _x;
  void increaseX(){
    _x++;
    update();
    print(_x);
  }


  void decrease() {
    _x--;
    update();
    print(_x);
  }
}