import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneysender/providers/recenteTransaction_provider.dart';
import 'package:moneysender/util/constant.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VoirPlus extends StatefulWidget {
  const VoirPlus({super.key});

  @override
  State<VoirPlus> createState() => _VoirPlusState();
}

class _VoirPlusState extends State<VoirPlus> {
  late RecenteTransactionProvider recenteTransactionProvider;
  gettransaction() {
    recenteTransactionProvider.getRecenteTransaction();
  }

  @override
  void initState() {
    recenteTransactionProvider = context.read<RecenteTransactionProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gettransaction();
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<RecenteTransactionProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Historique de payement",
          style: GoogleFonts.poppins(
            fontSize: 15,
          ),
        ),
        actions: const [Icon(Icons.search)],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              child: ListView.builder(
                itemCount: controller.data!.length,
                itemBuilder: (context, index) {
                  if (controller.data == null) {
                    return Center(
                      child: Text("Data not found"),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context ,
                      //     MaterialPageRoute(
                      //         builder: (context) => DetailHistorique(

                      //         ))
                      //         );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            controller.data![index].provider == "orange"
                                ? Image(
                                    height: 5.h,
                                    image:
                                        AssetImage("assets/images/Orange.png"),
                                  )
                                : controller.data![index].provider == "moov"
                                    ? const Image(
                                        height: 50.0,
                                        image: AssetImage(
                                            "assets/images/moov.jpg"),
                                      )
                                    : controller.data![index].provider == "mtn"
                                        ? const Image(
                                            height: 50.0,
                                            image: AssetImage(
                                                "assets/images/Mtn.png"),
                                          )
                                        : controller.data![index].provider ==
                                                "wave"
                                            ? const Image(
                                                height: 50.0,
                                                image: AssetImage(
                                                    "assets/images/wave.png"),
                                              )
                                            : Container(
                                                height: 50,
                                                width: 50,
                                                color: VioletPureColor,
                                                child: Center(
                                                  child: Text(
                                                    "?",
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                            SizedBox(
                              width: 2.w,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${controller.data![index].recipientContact}",
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
                                        child: Text(
                                          "${controller.data![index].createdAt}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 150, 150, 151),
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
                                        "${controller.data![index].amount}",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 16, 87, 240),
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
                                            "${controller.data![index].status}",
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
