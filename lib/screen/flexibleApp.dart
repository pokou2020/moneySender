import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moneysender/providers/userInfo_provider.dart';
import 'package:moneysender/util/constant.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
class MyFlexiableAppBar extends StatefulWidget {

  @override
  State<MyFlexiableAppBar> createState() => _MyFlexiableAppBarState();
}

class _MyFlexiableAppBarState extends State<MyFlexiableAppBar> {

  //  late UserinfoProvider userInfo;
  //   gettUser() {
  //   userInfo.getUserinfo();
  // }

  void initState() {
    // TODO: implement initState
  //  userInfo=context.read<UserinfoProvider>();
    _getStatistic();
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   gettUser();
    // });
  }
  double?datatotalamountsuccess;
  double?datatrancDuJour;
  @override
  Widget build(BuildContext context) {


   
    return Scaffold(
      body: SafeArea(
        
      
        child: Card(
          elevation: 1,
          child: Container(
            height: 23.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
            
                    Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(height: 7.h,
                  width: 40.w,
                 
                  decoration: BoxDecoration(
                    
                     border: Border.all(
                      color: VioletPureColor,
                      
                     ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:    Center(
                    child:  Text(
                               "T. ${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}",
                               style:  TextStyle(
                                color:  OrangeNorColor,
                                   fontFamily: 'Poppins',
                                   fontSize: 15,
                                    fontWeight: FontWeight.bold
                               )
                           ),
                  ),
                  ),
                       Container(height: 7.h,
                  width: 40.w,
                 
                  decoration: BoxDecoration(
                    
                        border: Border.all(
                      color: VioletPureColor,
                      
                      
                     ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child:     datatotalamountsuccess==null?const Text("...",
                style: TextStyle(
                       color: Colors.green,
                       fontFamily: 'Poppins',
                       fontWeight: FontWeight.w800,
                       fontSize: 20.0
                   ),
                ):  Text(
                   "${datatrancDuJour} XOF",
                   style:  TextStyle(
                    color:  OrangeNorColor,
                       fontFamily: 'Poppins',
                       fontWeight: FontWeight.w800,
                       fontSize: 20.0
                   )
                                    ),
                  ),
                  ),
                ],
              ),
                
               
                                  
            
              
                 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(height: 7.h,
                  width: 40.w,
                 
                  decoration: BoxDecoration(
                     
                        border: Border.all(
                      color: VioletPureColor,
                      
                     ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:   Center(
                    child:  Text(
                               "Transfert Total",
                               style:  TextStyle(
                               color:  OrangeNorColor,
                                   fontFamily: 'Poppins',
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold
                               )
                           ),
                  ),
                  ),
                       Container(height: 7.h,
                  width: 40.w,
                 
                  decoration: BoxDecoration(
                    
                        border: Border.all(
                      color: VioletPureColor,
                      
                     ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:  Center(
                    child:  Text(
                               "${datatotalamountsuccess} XOF",
                               style: TextStyle(
                                  color:  OrangeNorColor,
                                   fontFamily: 'Poppins',
                                   fontWeight: FontWeight.w800,
                                   fontSize: 20.0
                               )
                                                         ),
                  ),
                  ),
                ],
              ),
                      
                                
                            
                        
              
                       
              
              ],),
          ),
        ),
         
      ),
    );
  }

   Future<void> _getStatistic() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? access_token = pref.getString('access_token');

    var url =
        "https://payvortex.doubleclic-tech.com/statistics/transactions/";

    var response = await http.get(Uri.parse(url), headers: {
    HttpHeaders.authorizationHeader: 'Bearer ${access_token}',
  },);

    print("===response _getStatistic ===");
    print(response.body);
    print(access_token);
    print("===response _getStatistic ===");
      var jsonListStaristic = jsonDecode(response.body);
       print("//////////datatotaltransactions///////////");
      print(jsonListStaristic);
       print("//////////datatotaltransactions///////////");
     var datatotaltransactions=jsonListStaristic["total_amount_success"];
     var trancDuJour=jsonListStaristic["total_amount"];
              print("//////////datatotaltransactions///////////");
              print(datatotaltransactions);
    if (response.statusCode == 200) {
     
setState(() {
  datatotalamountsuccess=datatotaltransactions;
  datatrancDuJour=trancDuJour;
});
      

  }

}
}