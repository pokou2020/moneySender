import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/constant.dart';
import 'SaisirUnNouveauNum.dart';

class ChoixReseau extends StatefulWidget {
  final String? serial_number,station_id,pin_transaction;
  const ChoixReseau({
    Key? key,
    required this.serial_number,
    required this.station_id,
    required this.pin_transaction,
  }) : super(key: key);

  @override
  State<ChoixReseau> createState() => _ChoixReseauState();
}

class _ChoixReseauState extends State<ChoixReseau> {
  @override
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          "Faire un transfert via",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SaisirUnNouveauNum(
                        pin_transaction:widget.pin_transaction ,
                        serial_number: widget.serial_number,
                        station_id: widget.station_id,
                      ))
                    
                      );
                      setState(() {
                        // _initiationPayemntPost();
                      });
                },
                child: Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/moov.jpg")),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Moov",
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              "Côte d'ivoire",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_circle_right_outlined,
                          color: VioletPureColor)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Transfert()));
                },
                child: Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/Mtn.png")),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mtn",
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              "Côte d'ivoire",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_circle_right_outlined,
                          color: VioletPureColor)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Transfert()));
                },
                child: Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/Orange.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Orange",
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              "Côte d'ivoire",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_circle_right_outlined,
                          color: VioletPureColor)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Transfert()));
                },
                child: Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 243, 243, 243),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/wave.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Wave",
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              "Côte d'ivoire",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Color.fromARGB(255, 162, 1, 183),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
