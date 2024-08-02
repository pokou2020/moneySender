import 'package:flutter/material.dart';
import 'package:moneysender/model/userInfo_model.dart';
import 'package:moneysender/services/api_service.dart';

class UserinfoProvider with ChangeNotifier {
  UserInfoModel? dataUserinfoProvider;
  bool loading = false;
  Services services = Services();

  getUserinfo() async {
    loading = true;
    notifyListeners();
    dataUserinfoProvider = await services.getUserinfo();
    loading = false;
    notifyListeners();
  }
}
