import 'package:flutter/cupertino.dart';

class userDetailsModel extends ChangeNotifier{
  String _userName = "" ;

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    notifyListeners() ;
  }
}