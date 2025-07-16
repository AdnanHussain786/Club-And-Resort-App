import 'package:flutter/material.dart';


class OurProviderClass extends ChangeNotifier{

  int count = 0;

  String pageTitle='';
  bool blurEffectFirst = false;
  bool blurEffectSecond = false;
  bool blurEffectSecondOnBody = false;

  String selectedSessionId="";



  int get getIndex{
    return count;
  }


  String get getPageTitle{
    return pageTitle;
  }


  bool get getBlurEffectFirst{
    return blurEffectFirst;
  }

  bool get getBlurEffectSecond{
    return blurEffectSecond;
  }

  bool get getBlurEffectSecondOnBody{
    return blurEffectSecondOnBody;
  }


  String get getChatSession{
    return selectedSessionId;
  }

  void changeSelectedChatSession(String id) {
    selectedSessionId = id;
    notifyListeners();
  }



  void changeAppBarTitle(String title){
    pageTitle = title;
    notifyListeners();
  }


  void changeBottomNavBarIndex(int index){
    count = index;
    notifyListeners();
  }


  void showBlurEffectFirst(bool blur){
    blurEffectFirst = blur;
    notifyListeners();
  }



  void showBlurEffectSecond(bool blur){
    blurEffectSecond = blur;
    notifyListeners();
  }

  void showBlurEffectSecondOnBody(bool blur){
    blurEffectSecondOnBody = blur;
    notifyListeners();
  }


  void onlyChangeNotifier(){
    notifyListeners();
  }



}