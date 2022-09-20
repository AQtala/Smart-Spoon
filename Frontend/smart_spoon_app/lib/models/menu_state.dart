import 'package:flutter/cupertino.dart';

class MenuState with ChangeNotifier {
  bool isMenu = false;
  String type = "Login";
  void setMenu() {
    isMenu = !isMenu;
    notifyListeners();
  }

  bool getIsMenu() {
    return isMenu;
  }

  void setType() {
    if (type == "Login") {
      type = "Signup";
    } else {
      type = "Login";
    }
    notifyListeners();
  }

  String getType() {
    return type;
  }
}
