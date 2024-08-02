import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneysender/screen/StatistiqueUserPage.dart';
import 'package:moneysender/screen/connexion.dart';
import 'package:moneysender/util/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'QrCode.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  void initState() {
    // TODO: implement initState
     _getUserInfo();
    super.initState();
  }
  String?nameUser;
  String?contactUser;
  String?emailUserInfo;
  String?postUser;
  String?serial_number;
  String?company_id;
  String?station_id;
 
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              decoration: BoxDecoration(
                color: VioletPureColor,
                image: DecorationImage(image: AssetImage("assets/images/pp.jpg"), fit: BoxFit.cover)
              ),
               padding: EdgeInsets.symmetric(
                  horizontal: 120,
                  vertical: 120,
                ),
           
        
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   Icon(Icons.people_alt ,color: VioletPureColor,),
                  SizedBox(width: 10,),
                 nameUser==null?Text("..."): Text("${nameUser}",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                           ),
                  ),
                ],
              ),
            ),
            Divider(
              endIndent: 50,
              indent: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   Icon(Icons.format_list_numbered_rounded ,color: VioletPureColor,),
                  SizedBox(width: 10,),
                    contactUser==null?Text("..."): Text("${contactUser}",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                           ),
                  ),
                ],
              ),
            ),
               Divider(
              endIndent: 50,
              indent: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   Icon(Icons.email ,color: VioletPureColor,),
                  SizedBox(width: 10,),
                   emailUserInfo==null?Text("..."): Text("${emailUserInfo}",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                           ),
                  ),
                ],
              ),
            ),
               Divider(
              endIndent: 50,
              indent: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.work ,color: VioletPureColor,),
                  SizedBox(width: 10,),
                    postUser==null?Text("..."): Text("${postUser}",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                           ),
                  ),
                ],
              ),
            ),
                  Divider(
              endIndent: 50,
              indent: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StatistiqueUserPage(
                  user_id: serial_number ,
                )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.stacked_bar_chart ,color: VioletPureColor,),
                   SizedBox(width: 10,),
                    Text("Statistique",
                     style: GoogleFonts.poppins(
                        fontSize: 18,
                           ),
                    ),
                  ],
                ),
              ),
            ),
                        Divider(
              endIndent: 50,
              indent: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Qrcode(
                serial_number:serial_number,
                company_id:company_id,
                station_id:station_id,

                )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.qr_code ,color: VioletPureColor,),
                    SizedBox(width: 10,),
                    Text("Voir Qrcode",
                     style: GoogleFonts.poppins(
                        fontSize: 18,
                           ),
                    ),
                  ],
                ),
              ),
            ),
SizedBox(height: 30,),
            InkWell(
              onTap: (){
                _getalert();
    
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.login_sharp, color: VioletPureColor,),
                    SizedBox(width: 10,),
                    Text("Deconnexion",
                     style: TextStyle(
                    fontSize: 18,
                    
                  ),
                    )
                        
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

    Future<void> _getalert() async {
          showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: Text(
                'Etês vous sur?',
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Non',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                 InkWell(
                  onTap: ()async {
                
                      SharedPreferences pref= await SharedPreferences.getInstance();
                          pref.clear();
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Connexion()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Oui',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: Colors.red),
                    ),
                  ),
                ),
              ],
            );
          });
  }
  

  Future<void> _getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? access_token = pref.getString('access_token');

    var url =
        "https://payvortex.doubleclic-tech.com/users/me";

    var response = await http.get(Uri.parse(url), headers: {
    HttpHeaders.authorizationHeader: 'Bearer ${access_token}',
  },);

    print("===response _getUserInfo00 ===");
    print(response.body);
    print(access_token);
    print("===response _getUserInfo ===");
      var jsonUserInfo = jsonDecode(response.body);
       print("//////////_getUserInfo///////////");
       var  datafullname=jsonUserInfo["full_name"];
       var  datacontact=jsonUserInfo["contact"];
       var  dataemail=jsonUserInfo["email"];
     var  datalibelle=jsonUserInfo["group"];
    var datapost=datalibelle["libelle"];
    var dataserialnumber=jsonUserInfo["serial_number"];
    var companyid=jsonUserInfo["company_id"];
    var stationid=jsonUserInfo["station_id"];
     print("/////////////");
      print(dataserialnumber);
       print("/////////////");
       print("//////////_getUserInfo///////////");
  
    if (response.statusCode == 200) {
     
setState(() {
  nameUser=datafullname;
  contactUser=datacontact;
  emailUserInfo=dataemail;
  postUser=datapost;
  serial_number=dataserialnumber;
 company_id=companyid;
 station_id=stationid;
});
      

  }

}
}