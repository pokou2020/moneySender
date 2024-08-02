import 'package:flutter/material.dart';
import 'package:moneysender/model/model.dart';
import 'package:moneysender/services/api_service.dart';



class RecenteTransactionProvider with ChangeNotifier {
  List<RecenteTransactionModel>? _data;
  List<RecenteTransactionModel>? get data => _data;
  bool loading = false;
  Services services = Services();

  getRecenteTransaction() async {
    _data = null;
    notifyListeners();
    _data = await services.getRecenteTransaction();
    notifyListeners();
  }
}
