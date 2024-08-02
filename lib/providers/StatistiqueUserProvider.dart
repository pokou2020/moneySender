import 'package:flutter/material.dart';
import 'package:moneysender/model/statistiqueUser.dart';
import 'package:moneysender/services/api_service.dart';

class StatistiqueUserProvider with ChangeNotifier {
  StatistiqueUserModel? dataStatistique;

  bool loading = false;
  Services services = Services();

  getStatistiqueUser() async {
    loading = true;
    notifyListeners();
    dataStatistique = await services.getStatistiqueUser();
    loading = false;
    notifyListeners();
  }
}
