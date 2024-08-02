import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneysender/providers/recentPayementProvider.dart';
import 'package:moneysender/providers/recenteTransaction_provider.dart';
import 'package:moneysender/providers/userInfo_provider.dart';
import 'package:moneysender/screen/QrCode.dart';
import 'package:moneysender/screen/historiqueDePaye.dart';
import 'package:moneysender/screen/historiqueDeTransfert.dart';
import 'package:moneysender/screen/voirPlus.dart';
import 'package:moneysender/util/constant.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sizer/sizer.dart';
import 'ChoixReseau.dart';
import 'Detail.dart';
import 'connexion.dart';
import 'drawers.dart';
import 'flexibleApp.dart';

class HomeMoneysender extends StatefulWidget {
  final String? provider;
  const HomeMoneysender({
    Key? key,
    this.provider,
  }) : super(key: key);

  @override
  State<HomeMoneysender> createState() => _HomeMoneysenderState();
}

class _HomeMoneysenderState extends State<HomeMoneysender> {
  late RecenteTransactionProvider recenteTransactionProvider;
   late UserinfoProvider userInfo;
  
  gettransaction() {
    recenteTransactionProvider.getRecenteTransaction();
  }
  gettUser() {
    userInfo.getUserinfo();
  }
 
  @override
  void initState() {
    chekLogin();
    recenteTransactionProvider = context.read<RecenteTransactionProvider>();
    userInfo=context.read<UserinfoProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gettransaction();
      gettUser();
    });
    _getUserInfo();
  }


  void chekLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('access_token');
    print('access_token');
    print(val);
    print('access_token');
    if (val == null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Connexion(
                  //  academicyear:widget.academicyear
                  )));
    }
  }

  List dataserialnumber = [];
  String? serial_number;
  String? company_id;
  String? station_id;
  String? pin_transaction;

  @override
  Widget build(BuildContext context) {
    var controlleruserinfo = context.watch<UserinfoProvider>();
          if (controlleruserinfo.dataUserinfoProvider==null) {
                    return Scaffold(
         
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("Reconnectez vous svp"),
                          ),

                              TextButton(
                                style: const ButtonStyle(
                                elevation: WidgetStatePropertyAll(5),
                                
                                //  textStyle: TextStyle(color: Colors.red)
                                ),
                               onPressed: (){
                                   _getalert();
                               },
                                child: Text("Deconnexion",
                                     style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                  ),
                                    ),
                              )
                        ],
                      ),
                    );
                  }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 2.w, right: 2.w),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Drawers()));
                              },
                              child: Container(
                                height: 13.h,
                                width: 13.w,
                                decoration: BoxDecoration(
                                  color: OrangeNorColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: VioletPureColor,
                                  ),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.person_pin_circle_sharp,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                            Container(
                              height: 10.h,
                              width: 70.w,
                              child: ListTile(
                                title:  Text(
                                "${controlleruserinfo.dataUserinfoProvider!.fullName}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                "${controlleruserinfo.dataUserinfoProvider!.email}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.notification_add,
                          color: OrangeNorColor,
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: MyFlexiableAppBar(),
                  )),
              Row(
                children: [
                  Text(
                    "Nos services",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           ChoixReseau(
                                            serial_number: serial_number, station_id:station_id,pin_transaction: pin_transaction,
                                          )));
                            },
                            child: Container(
                              height: 13.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: VioletPureColor),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.send_to_mobile_sharp,
                                color: OrangeNorColor,
                                size: 25,
                              )),
                            ),
                          ),
                          Text(
                            'Tranfert',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HistoriquedeTransfert()));
                            },
                            child: Container(
                              height: 13.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: VioletPureColor),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.my_library_add_rounded,
                                color: OrangeNorColor,
                                size: 25,
                              )),
                            ),
                          ),
                          Text(
                            "T.Historique",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Historiquedepayement()));
                            },
                            child: Container(
                              height: 13.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: VioletPureColor),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.payment_outlined,
                                color: OrangeNorColor,
                                size: 25,
                              )),
                            ),
                          ),
                          Text(
                            "P.Historique",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Qrcode(serial_number: serial_number, company_id:company_id,station_id:station_id,)));
                            },
                            child: Container(
                              height: 13.h,
                              width: 17.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: VioletPureColor),
                                shape: BoxShape.circle,
                                // color: const Color.fromARGB(
                                //     255, 211, 211, 211),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.qr_code,
                                color: OrangeNorColor,
                                size: 25,
                              )),
                            ),
                          ),
                          Text(
                            "Qrcode",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
               Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  Text(
                    "Recentes transactions",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VoirPlus()));
                  },
                  child: Text(
                      "Plus",
                      style: GoogleFonts.poppins(
                          fontSize: 18, 
                          color: VioletPureColor
                          ),
                          
                    ),
                )
                ],
              ),
              SizedBox(height: 2.h,),
              Expanded(
                  flex: 4,
                  child: Container(
                    child: buildview(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildview() {
    var controller = context.watch<RecenteTransactionProvider>();
    if (controller.data!.isEmpty) {
      return Center(
        child: Text("Data not found"),
      );
    }

    return ListView.builder(
      itemCount: controller.data!.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailHistorique(
             amount: controller.data![index].amount,
             created_at: controller.data![index].createdAt,
             description: controller.data![index].description,
             provider: controller.data![index].provider,
             recipient_contact: controller.data![index].recipientContact,
             recipient_name: controller.data![index].recipientName,
             reference: controller.data![index].reference,
             status: controller.data![index].status,

              )));
            },
            child: ListTile(
              title: Text(controller.data![index].amount.toString(),
                 style: GoogleFonts.poppins(
                  fontSize: 18,
                      fontWeight: FontWeight.bold
                 
                ),
              ),
              
              subtitle: Text(
                controller.data![index].createdAt.toString(),
                   style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey
                  
                  
                ),
              ),
              trailing: Text(
                "${controller.data![index].amount}",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.green
                ),
              ),
            ),
          ),
        );
      },
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

      var jsonUserInfo = jsonDecode(response.body);
      
    if (response.statusCode == 200) {
      
      SharedPreferences serialnumberuser = await SharedPreferences.getInstance();
       await serialnumberuser.setString("serial_number", jsonUserInfo['serial_number']);
        SharedPreferences companyid = await SharedPreferences.getInstance();
        await companyid.setString("company_id", jsonUserInfo['company_id']);
           var companyiduser=jsonUserInfo["company_id"];
          var stationid=jsonUserInfo["station_id"];
          var serialnumber=jsonUserInfo['serial_number'];
           var pintransaction=jsonUserInfo['pin_transaction'];
          // var currency=jsonUserInfo['serial_number'];

print("//////serialnumber/////");
        print(serialnumberuser);
        print(companyid);
        print(response.body);
print("//////companyid/////");
setState(() {
  serial_number=serialnumber;
     company_id=companyiduser;
  station_id=stationid;
  pin_transaction=pintransaction;
});
      

  }

}

}

