
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/constant.dart';


class DetailHistorique extends StatefulWidget {
  final String provider,reference,recipient_contact,recipient_name,description,status,created_at;
 final int amount;
  const DetailHistorique(
    {Key?key,
    required this.provider,
    required this.created_at,
    required this.description,
    required this.recipient_contact,
    required this.recipient_name,
    required this.reference,
    required this.status,
    required this.amount,
  

    }):super(key: key);

  @override
  State<DetailHistorique> createState() => _DetailHistoriqueState();
}

class _DetailHistoriqueState extends State<DetailHistorique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Detail",
            style: GoogleFonts.poppins(
              
                        fontSize: 15,
                           ),
        ),
      
      ),
      body:ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index){
        return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              
               height: MediaQuery.of(context).size.height/1.4,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
                
               ),
               child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [
                         Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("Opérateur d'expédition",
                           style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                           ),
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(widget.provider,
                               style: GoogleFonts.poppins(
                                fontSize: 15,
                               ),
                              ),
                               Container(height: 17,width: 17,
                                 decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("assets/images/arrowback.png"))
                                 ),)
                              
                            ],
                          ),
                                         widget.provider=="orange"?   const Image(
                        height: 50.0,
                        image: AssetImage("assets/images/Orange.png"),
                      ):widget.provider=="moov"?const Image(
                        height: 50.0,
                        image: AssetImage("assets/images/moov.jpg"),
                      ): widget.provider=="mtn"?const Image(
                        height: 50.0,
                        image: AssetImage("assets/images/Mtn.png"),
                      ): widget.provider=="wave"?const Image(
                        height: 50.0,
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
                      )
                      
                        ],
                      ),
                   
                    ],
                  ),
                ),
                Divider(
                  endIndent: 10,
                  indent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("Expéditeur",
                           style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                           ),
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Compagnie",
                           style: GoogleFonts.poppins(
                            fontSize: 15,
                           ),
                          ),
                           Text("UTB",
                            style: GoogleFonts.poppins(
                            fontSize: 15,
                           ),
                           )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  endIndent: 10,
                  indent: 10,
                ),
           
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                                         Text("Bénéficiaire ",
                           style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                           ),
                                           ),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text("Numéro de téléphone ",
                           style: GoogleFonts.poppins(
                            fontSize: 15,
                           ),
                                           ),
                           Text(widget.recipient_contact,
                            style: GoogleFonts.poppins(
                            fontSize: 15,
                           ),
                           )
                            ],
                            ),
                         ],
                       ),
                     ),
              Divider(
                  endIndent: 10,
                  indent: 10,
                ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                              Text("Transaction ",
                                              style: GoogleFonts.poppins(
                                               fontSize: 17,
                                               fontWeight: FontWeight.bold
                                              ),
                                             ),
                                               Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                      Text("ID Transaction",
                                              style: GoogleFonts.poppins(
                                               fontSize: 13,
                                            
                                              ),
                                             ),
                                                   Text(widget.reference,
                                              style: GoogleFonts.poppins(
                                                   fontSize: 15,
                                                   color: Colors.grey
                                              ),
                                             ),
                                                 ],
                                               ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Text("Date ",
                                              style: GoogleFonts.poppins(
                                               fontSize: 15,
                                    
                                              ),
                                             ),
                                              Text(widget.created_at,
                                               style: GoogleFonts.poppins(
                                               fontSize: 15,
                                              ),
                                              )
                                           ],
                                         ),
                                               Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Text("Montant",
                                              style: GoogleFonts.poppins(
                                               fontSize: 15,
                                  
                                              ),
                                             ),
                                              Text(widget.amount.toString()+" FCFA",
                                               style: GoogleFonts.poppins(
                                               fontSize: 15,
                                              ),
                                              )
                                           ],
                                         ),
                                           Divider(
                  endIndent: 10,
                  indent: 10,
                ),

                
              
                           ],
                         ),
                       ),
                                                       Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text("Statut",
                           style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                           ),
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Etat ",
                           style: GoogleFonts.poppins(
                            fontSize: 15,
                           ),
                          ),
                           Text(widget.status,
                            style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.green
                           ),
                           )
                        ],
                      ),
                    ],
                  ),
                ),
                      //  Padding(
                      //    padding: const EdgeInsets.all(8.0),
                      //    child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                  children: [
                      //                    Text("Heure: ",
                      //                     style: GoogleFonts.poppins(
                      //                      fontSize: 15,
                      //                     ),
                      //                    ),
                      //                     Text("10h30",
                      //                     style: GoogleFonts.poppins(
                      //                      fontSize: 15,
                      //                     ),
                      //                     )
                      //                  ],
                      //                ),
                      //  ),
                        //  Padding(
                        //    padding: const EdgeInsets.all(8.0),
                        //    child: Row(
                        //                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                  children: [
                        //                    Text("Statut:",
                        //                     style: GoogleFonts.poppins(
                        //                      fontSize: 20,
                        //                     ),
                        //                    ),
                        //                     Text("Succés",
                        //                      style: GoogleFonts.poppins(
                        //                      fontSize: 20,
                        //                      color: Colors.green
                        //                     ),
                        //                     )
                        //                  ],
                        //                ),
                        //  ),
                        //      Padding(
                        //    padding: const EdgeInsets.all(8.0),
                        //    child: Row(
                        //                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                  children: [
                        //                    Text("Operateur:",
                        //                     style: GoogleFonts.poppins(
                        //                      fontSize: 20,
                        //                     ),
                        //                    ),
                        //                     Text("Orange",
                        //                      style: GoogleFonts.poppins(
                        //                      fontSize: 20,
                        //                      color: VioletPureColor
                        //                     ),
                        //                     )
                        //                  ],
                        //                ),
                        //  ),
                        //      Padding(
                        //    padding: const EdgeInsets.all(8.0),
                        //    child: Row(
                        //                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                  children: [
                        //                    Text("Bénéficiaire:",
                        //                     style: GoogleFonts.poppins(
                        //                      fontSize: 20,
                        //                     ),
                        //                    ),
                        //                     Text("0747518059",
                        //                      style: GoogleFonts.poppins(
                        //                      fontSize: 20,
                        //                      color: OrangeNorColor
                        //                     ),
                        //                     )
                        //                  ],
                        //                ),
                        //  ),
           
                    //            Padding(
                    //              padding: const EdgeInsets.all(8.0),
                    //              child: Row(
                    //                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                            children: [
                    //                              Text("ID Transaction:",
                    //                               style: GoogleFonts.poppins(
                    //   fontSize: 20,
                    //  ),
                    //                              ),
                    //                               Text("YFBXJNCJNC",
                    //                                style: GoogleFonts.poppins(
                    //   fontSize: 20,
                    //   color: Colors.red
                    //  ),
                    //                               )
                    //                            ],
                    //                          ),
                    //            ),
               ]),
           
               
               
             ),
           );
      })
    );
  }
}