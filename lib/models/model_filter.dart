import 'package:flutter/cupertino.dart';

class Filter with ChangeNotifier {
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool firstTime;

  Filter({
    this.isVegetarian = false,
    this.isVegan = false,
    this.isLactoseFree = false,
    this.isGlutenFree = false,
  });

  void setData({bool gluten, bool vegan, bool vegetarian, bool lactose}) {
    isGlutenFree = gluten;
//    isVegan = vegan;
//    isVegetarian = vegetarian;
//    isLactoseFree = lactose;
    firstTime = true;
    notifyListeners();
  }

  void setGluten(bool value) {
    isGlutenFree = value;
    notifyListeners();
  }

  void setLactose(bool value) {
    isLactoseFree = value;
    notifyListeners();
  }

  void setVegan(bool value) {
    isVegan = value;
    notifyListeners();
  }

  void setVegetarian(bool value) {
    isVegetarian = value;
    notifyListeners();
  }
}
