// import 'package:flutter/material.dart';
// import 'package:moneysender/model/recentPayementModel.dart';

// class Recherchetransfert extends SearchDelegate<String> {
//   final List<String> dataHistoriquePayement = [];



//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () => Navigator.of(context).pop(),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final List<String> searchResults = dataHistoriquePayement
//         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     return ListView.builder(
//       itemCount: searchResults.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(searchResults[index]),
//           onTap: () {
//             // Handle the selected search result.
//             close(context, searchResults[index]);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final List suggestionList = query.isEmpty
//         ? []
//         : dataHistoriquePayement
//             .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//             .toList();

//     return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(suggestionList[index]),
//           onTap: () {
//             query = suggestionList[index];
//             // Show the search results based on the selected suggestion.
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:moneysender/model/recentPayementModel.dart';
import 'package:moneysender/screen/detail_payement.dart';
import 'package:moneysender/services/api_service.dart';
import 'package:moneysender/util/constant.dart';
import 'package:sizer/sizer.dart';


class SearchUser extends SearchDelegate {
  Services _paimntList = Services();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close,color: VioletPureColor))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: VioletPureColor,),
      onPressed: () {
       
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<RecentePayementModel>>(
        future: _paimntList.getRecentePayement(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<RecentePayementModel>? data = snapshot.data;
          return  data!.isEmpty?Center(child: Text("Aucun resultat correspondant")): ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(

                  onTap:(){
                      Navigator.push(
                        context ,
                        MaterialPageRoute(
                            builder: (context) => DetailPayement(
                              amount:data![index].amount!.toDouble() ,
            created_at:data[index].createdAt.toString(),
            //  description:controllerPayement[index]["description"],
              provider: data[index].provider.toString(),
              number:data[index].recipientContact.toString(),
              
           // name: controllerPayement[index]["name"],
              intentId: data[index].id.toString(),
              status:data[index].status.toString(),
                            ))
                      );
               
                  },
                  child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              data?[index].provider == "orange"
                                  ? Image(
                                      height: 6.h,
                                      image: AssetImage(
                                          "assets/images/Orange.png"),
                                    )
                                  : data?[index].provider == "moov"
                                      ? Image(
                                          height: 6.h,
                                          image: AssetImage(
                                              "assets/images/moov.jpg"),
                                        )
                                      : data?[index].provider ==
                                              "mtn"
                                          ? Image(
                                              height: 6.h,
                                              image: AssetImage(
                                                  "assets/images/Mtn.png"),
                                            )
                                          : data?[index].provider ==
                                                  "wave"
                                              ? Image(
                                                  height: 6.h,
                                                  image: AssetImage(
                                                      "assets/images/wave.png"),
                                                )
                                              : Container(
                                                  height: 6.h,
                                                  width: 6.h,
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
                                          "${data?[index].recipientContact}",
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
                                            "${data?[index].createdAt}",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${data?[index].amount}",
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
                                              "${data?[index].status}",
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
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Recherche'),
    );
  }
}