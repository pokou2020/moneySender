// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'package:moneysender/providers/recentPayementProvider.dart';
import 'package:moneysender/screen/Detail.dart';
import 'package:moneysender/screen/detail_payement.dart';
import 'package:moneysender/screen/rechercheTransfert.dart';
import 'package:moneysender/util/constant.dart';

class HistoriquedeTransfert extends StatefulWidget {
   final String? provider;
  const HistoriquedeTransfert({
    Key? key,
    this.provider,
  }) : super(key: key);

  @override
  State<HistoriquedeTransfert> createState() => _HistoriquedeTransfertState();
}

class _HistoriquedeTransfertState extends State<HistoriquedeTransfert> {
   late RecentePayementProvider recentePayementProvider;
  getPayement(){
    recentePayementProvider.getRecentePayement();
  }


  @override
  void initState() {
   
   recentePayementProvider = context.read<RecentePayementProvider>();
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getPayement();
  });
  }

 
  
  @override
  Widget build(BuildContext context) {
     var controllerPayement = context.watch<RecentePayementProvider>();
          if (controllerPayement.dataPayement!.isEmpty) {
                    return Scaffold(
                      appBar: AppBar(
        title: Text(
          "Historique de Transfert",
          style: GoogleFonts.poppins(
            fontSize: 15,
          ),
        ),
        actions: const [Icon(Icons.search)],
      ),
                      body: Center(
                        child: Text("Data not found"),
                      ),
                    );
                  }
    return Scaffold(
      appBar: AppBar(
      
        title: Text(
          "Historique de Transfert",
          style: GoogleFonts.poppins(
            fontSize: 15,
          ),
        ),
       
      ),
       floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: const Icon(Icons.search),
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: SearchUser(),
              );
                  },
          ),
        ),
      body: Column(
        children: [
          
       
              Expanded(
               flex: 8,
                child: Container(
            
                  child: ListView.builder(
                    itemCount: controllerPayement.dataPayement!.length,
                 itemBuilder: (context, index){
                  return  InkWell(
                  onTap: () {
                    Navigator.push(
                        context ,
                        MaterialPageRoute(
                            builder: (context) => DetailPayement(
                              amount:controllerPayement.dataPayement![index].amount!.toDouble() ,
            created_at:controllerPayement.dataPayement![index].createdAt.toString(),
            //  description:controllerPayement[index]["description"],
              provider: controllerPayement.dataPayement![index].provider.toString(),
              number:controllerPayement.dataPayement![index].recipientContact.toString(),
              
           // name: controllerPayement[index]["name"],
              intentId: controllerPayement.dataPayement![index].id.toString(),
              status:controllerPayement.dataPayement![index].status.toString(),
                            ))
                            );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                                       controllerPayement.dataPayement![index].provider=="orange"?    Image(
                        height: 5.h,
                        image: AssetImage("assets/images/Orange.png"),
                      ): controllerPayement.dataPayement![index].provider=="moov"? Image(
                       height: 5.h,
                        image: AssetImage("assets/images/moov.jpg"),
                      ):   controllerPayement.dataPayement![index].provider=="mtn"? Image(
                       height: 5.h,
                        image: AssetImage("assets/images/Mtn.png"),
                      ):  controllerPayement.dataPayement![index].provider=="wave"? Image(
                       height: 5.h,
                        image: AssetImage("assets/images/wave.png"),
                      ):Container(
                        height: 50,
                        width: 50,
                        color: VioletPureColor,
                        child: Center(
                          child: Text("?",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white
                          ),
                          ),
                        ),
                      ),
                           SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                     controllerPayement.dataPayement![index].recipientContact.toString(),
                                      style: TextStyle(
                                          color: Color(0xff3a2483),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // ignore: avoid_unnecessary_containers
                                    Container(
                                      child:  Text(
                                        controllerPayement.dataPayement![index].createdAt.toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 150, 150, 151),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                     Text(
                                      controllerPayement.dataPayement![index].amount.toString(),
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 16, 87, 240),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                         Text(
                                        controllerPayement.dataPayement![index].status.toString(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                           const SizedBox(
                                      width: 5,
                                    ),
                          
                                    
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                            );
                 },
                  ),
                ),
              )
            
   

        ],
      ),
    );
  }


}
