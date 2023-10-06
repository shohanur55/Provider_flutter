import 'package:flutter/material.dart';

class Numberprovider extends ChangeNotifier {
  List<int> a = [1, 2, 3, 4, 5];

  void add() {
    int last = a.last;
    a.add(last + 1);
    notifyListeners();
  }
}

class CountNumber extends ChangeNotifier {
  int value = 40;
//get val=>value;  u can use this,,but it is not required..without it the function can be work
  void counting() {
    value++;
    notifyListeners();
  }
}

class Watchingtime extends ChangeNotifier {
  timing() {
    notifyListeners();
  }
}

class Sliderchanging extends ChangeNotifier {
  double value = 1.0;
  // double get value=>_value;
  void changing(double val) {
    value = val;
    notifyListeners();
  }
}

class Favouriteselection extends ChangeNotifier {
  List selecteditem = [];


void itemselection(int index){
  if(selecteditem.contains(index)){
    selecteditem.remove(index);
  }else{
    selecteditem.add(index);
  }

  notifyListeners();
}

 selectionpageremove(int index){
  selecteditem.remove(index);
  notifyListeners();

}


}

class Themechanger extends ChangeNotifier{

  var mytheme="light";
get theme=>mytheme;
   void themechanger(var value){
     mytheme=value.toString();
     notifyListeners();
   }

}
