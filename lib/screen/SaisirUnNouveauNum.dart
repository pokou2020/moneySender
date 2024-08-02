import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../util/constant.dart';

class SaisirUnNouveauNum extends StatefulWidget {
  final String? serial_number, station_id, pin_transaction;
  const SaisirUnNouveauNum(
      {super.key,
      required this.serial_number,
      required  this.station_id, 
      required  this.pin_transaction});

  @override
  State<SaisirUnNouveauNum> createState() => _SaisirUnNouveauNumState();
}

class _SaisirUnNouveauNumState extends State<SaisirUnNouveauNum> {
  final _formkey = GlobalKey<FormState>();
    final dateMontantController = TextEditingController();
  final dateNumeroController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Transaction operateur moov Monney",
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 10.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/moov.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                    child: TextFormField(
                      controller: dateNumeroController,
                      decoration: const InputDecoration(
                        //     enabledBorder: OutlineInputBorder(
                        //  // borderSide:BorderSide(color: Colors.blueGrey, width: 2.0)
                        //   ),
                        // border: OutlineInputBorder(borderSide: BorderSide()),
                        border: OutlineInputBorder(borderSide: BorderSide()),

                        filled: true,
                        hintText: 'Téléphone ',
                        labelText: ' +225',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                    child: TextFormField(
                      controller: dateMontantController,
                      decoration: const InputDecoration(
                        //   enabledBorder: OutlineInputBorder(
                        //  // borderSide:BorderSide(color: Colors.blueGrey, width: 2.0)
                        //   ),
                        
                        border: OutlineInputBorder(borderSide: BorderSide()),

                        filled: true,

                        hintText: 'Montant',
                        labelText: 'Montant',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 5, right: 8),
                    child: TextFormField(
                      // controller: "${widget.pin_transaction.}",
                      decoration: const InputDecoration(
                        //   enabledBorder: OutlineInputBorder(
                        //  // borderSide:BorderSide(color: Colors.blueGrey, width: 2.0)
                        //   ),
                        border: OutlineInputBorder(borderSide: BorderSide()),

                        filled: true,

                        hintText: 'Code Pin',
                        labelText: 'Code Pin',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Chip(
                  //       label: Text(
                  //         "100 FCFA",
                  //         style: GoogleFonts.poppins(
                  //           color: VioletPureColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15,
                  //         ),
                  //       ),
                  //       onDeleted: () {},
                  //     ),
                  //     Chip(
                  //       label: Text(
                  //         "500 FCFA",
                  //         style: GoogleFonts.poppins(
                  //           color: VioletPureColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15,
                  //         ),
                  //       ),
                  //       onDeleted: () {},
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Chip(
                  //       label: Text(
                  //         "200 FCFA",
                  //         style: GoogleFonts.poppins(
                  //           color: VioletPureColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15,
                  //         ),
                  //       ),
                  //       onDeleted: () {},
                  //     ),
                  //     Chip(
                  //       label: Text(
                  //         "300 FCFA",
                  //         style: GoogleFonts.poppins(
                  //           color: VioletPureColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15,
                  //         ),
                  //       ),
                  //       onDeleted: () {},
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _initiationPayemntPost();
                        });
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailTransaction()));
                      },
                      child: Container(
                          height: 7.h,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                              color: VioletPureColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "Envoyé",
                            style: GoogleFonts.poppins(
                              color: BienvenueBackground,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _initiationPayemntPost() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? access_token = pref.getString('access_token');
  if(dateNumeroController.text.isNotEmpty && dateMontantController.text.isNotEmpty ){
    var url = "https://payvortex.doubleclic-tech.com/transactions/";
    var response = await http.post(
      Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${access_token}',
        },
        body: ({
          "pin_transaction":"${widget.pin_transaction}",
          "station_id": "${widget.station_id}",
          "user_id": "${widget.serial_number}",
          "amount":dateMontantController.text,
          "currency": "xof",
          "description": "Monnaie effectué par l'utilisateur: ${widget.serial_number}",
          "type_transaction": "mobile_money",
          "country": "CI",
          "recipientName": "utb",
          "msisdn": dateNumeroController.text,
          "provider": "mtn"
        }));
        print("///initiationPayemntPost///");
    print("${dateNumeroController.text}");
     print("${dateMontantController.text}");
    print("${widget.serial_number}");
    print("${widget.station_id}");
    print("${widget.pin_transaction}");
    print("///initiationPayemntPost///");
            if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text("Transaction Effectuée"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         backgroundColor: Colors.red,
        content: Text("Transaction echoué"),
      ));
    }
  }else{
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alerte"),
            content: Text("Remplissez le formulaire"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("ok"),
              )
            ],
          );
        });
  }
  } 

    


}
