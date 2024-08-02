import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:moneysender/model/model.dart';
import 'package:moneysender/model/recentPayementModel.dart';
import 'package:moneysender/model/statistiqueUser.dart';
import 'package:moneysender/model/userInfo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  //Afficher la liste des transation
  Future<List<RecenteTransactionModel>> getRecenteTransaction(
      {String? querytransac}) async {
    // late List<RecenteTransactionModel>data;

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? access_token = pref.getString('access_token');
         SharedPreferences serialnumberuser = await SharedPreferences.getInstance();
    String? serial_numberuser = serialnumberuser.getString('serial_number');
      
      var url = 'https://payvortex.doubleclic-tech.com/user-transactions/$serial_numberuser';
      var response = await http.get(
        Uri.parse(url),
        headers: {
         
          HttpHeaders.authorizationHeader: 'Bearer ${access_token}',
        },
      );

      if (response.statusCode == 200) {
        print("/////////////response.bodynew///////////");
        print(response.body);

        print("/////////////response.bodynew///////////");

        var transac = List<RecenteTransactionModel>.from(json
            .decode(response.body)
            .map((x) => RecenteTransactionModel.fromJson(x)));
        if (querytransac != null) {
          transac = transac
              .where((element) => element.recipientContact!
                  .toLowerCase()
                  .contains((querytransac.toLowerCase())))
              .toList();
        }

        return transac;
      } else {
        print("/////////////Ereur read transactions///////////");
      }
    } catch (e) {
      print("/////////////Erreur Occurred///////////");
      print('Error Occurred' + e.toString());
      print("/////////////Erreur Occurred///////////");
    }
    return [];
  }

  //Affichez la liste des payements

  Future<List<RecentePayementModel>> getRecentePayement({String? query}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? access_token = pref.getString('access_token');
       SharedPreferences companyid = await SharedPreferences.getInstance();
    String? company_id = companyid.getString('company_id');
        SharedPreferences serialnumberuser = await SharedPreferences.getInstance();
    String? serial_numberuser = serialnumberuser.getString('serial_number');
      var url = "https://payvortex.doubleclic-tech.com/payments";

      var response = await http.get(
        Uri.parse(url),
        headers: {
          "user-id":"$serial_numberuser",
          'company-id': "$company_id",
          HttpHeaders.authorizationHeader: 'Bearer ${access_token}',
        },
      );

    
      if (response.statusCode == 200) {
        print("/////////////response.payements///////////");
        print(response.body);
        // print(results);
        print("/////////////response.payements///////////");

        var results = List<RecentePayementModel>.from(json
            .decode(response.body)
            .map((x) => RecentePayementModel.fromJson(x)));
        if (query != null) {
          results = results
              .where((element) => element.recipientContact!
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList();
        }
        return results;
      }
    } catch (e) {
      print("/////////////Erreur lors de l'affichage des payement///////////");
      print('Error Occurred' + e.toString());
      print("/////////////Erreur lors de l'affichage des payement///////////");
    }
    return [];
  }

  //Les statistiques de l'utilisateur

  Future<StatistiqueUserModel> getStatistiqueUser() async {
    late StatistiqueUserModel dataStatistique;

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? access_token = pref.getString('access_token');
          SharedPreferences serialnumberuser = await SharedPreferences.getInstance();
    String? serial_numberuser = serialnumberuser.getString('serial_number');
    print(serial_numberuser);
      var url =
          'https://payvortex.doubleclic-tech.com/users/statistics/$serial_numberuser/transactions';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${access_token}',
        },
      );

      if (response.statusCode == 200) {
        print("/////////////response.Sta///////////");
        print(response.body);

        print("/////////////response.sta///////////");
        final item = json.decode(response.body);
        dataStatistique = StatistiqueUserModel.fromJson(item);
      }
    } catch (e) {
      print("/////////////Erreur lors de l'affichage des payement///////////");
      print('Error Occurred' + e.toString());
      print("/////////////Erreur lors de l'affichage des payement///////////");
    }
    return dataStatistique;
  }

  //Info de l'utilisateur

  Future<UserInfoModel?> getUserinfo() async {
    UserInfoModel? dataUser;

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? access_token = pref.getString('access_token');
      var url = 'https://payvortex.doubleclic-tech.com/users/me';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${access_token}',
        },
      );

      if (response.statusCode == 200) {
        print("/////////////response.User///////////");
        print(response.body);

        print("/////////////response.User///////////");
        final item = json.decode(response.body);
        dataUser = UserInfoModel.fromJson(item);
       
      }
    } catch (e) {
      print("/////////////Erreur lors de l'affichage des payement///////////");
      print('Error Occurred' + e.toString());
      print("/////////////Erreur lors de l'affichage des payement///////////");
    }
    return dataUser;
  }
}
