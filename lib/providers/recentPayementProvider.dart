import 'package:flutter/material.dart';
import 'package:moneysender/model/recentPayementModel.dart';
import 'package:moneysender/services/api_service.dart';



class RecentePayementProvider with ChangeNotifier {
  List<RecentePayementModel>? _dataPayement;
  List<RecentePayementModel>? get dataPayement => _dataPayement;
  bool loading = false;
  Services services = Services();

  getRecentePayement() async {
    _dataPayement = null;
    notifyListeners();
    _dataPayement = await services.getRecentePayement();
    notifyListeners();
  }
}
