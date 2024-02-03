import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TapController extends GetxController{

  int _x = 0;
  int get x => _x;

  RxInt _y=0.obs;
  RxInt get y=> _y;

  void increaseX(){
    _x++;
    update();
    print(_x);
  }


  void decreaseX() {
    _x--;
    update();
    print(_x);
  }


  void increaseY(){
    _y.value++;
    // update();
    print(_y.value);
  }


  void decreaseY() {
    _y.value--;
    // update();
    print(_y.value);
  }


}


