import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TapController extends GetxController{
    int _x = 0;
    int get x => _x;

    RxInt  _y = 0.obs;
    RxInt get y => _y;

    int _z = 0;
    int get z => _z;

    void increaseX() {
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
    }

    void decreaseY(){
      _y.value--;
    }

    void addXandY() {
      _z = _x + _y.value;
      print(_z);
    }
}