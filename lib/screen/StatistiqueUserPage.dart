import 'package:flutter/material.dart';
import 'package:moneysender/providers/StatistiqueUserProvider.dart';
import 'package:moneysender/util/constant.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class StatistiqueUserPage extends StatefulWidget {
  final String? user_id;
  const StatistiqueUserPage({super.key, required this.user_id});

  @override
  State<StatistiqueUserPage> createState() => _StatistiqueUserPageState();
}

class _StatistiqueUserPageState extends State<StatistiqueUserPage> {
  late StatistiqueUserProvider statistiqueUserProvider;
  getStatistique() {
    statistiqueUserProvider.getStatistiqueUser();
  }

  @override
  void initState() {
    statistiqueUserProvider = context.read<StatistiqueUserProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getStatistique();
    });
  }

  @override
  Widget build(BuildContext context) {
    var controllerStatistiqueUser = context.watch<StatistiqueUserProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Statistique"),
      ),
      body: SafeArea(
          child: Expanded(
        child: Container(
          child: ListView.builder(
            itemCount:1,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: VioletPureColor,
                            height: 2.h,width: 60.w,),
                           
                          Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalTransactions}"),
                          ),
                        ],
                      ),
                    ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                          Container(
                            color: Colors.blue,
                            height: 2.h,width: 15.w,),
                            
                          Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalAmount}"),
                          ),
                                               ],
                                             ),
                       ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Container(
                            color: Colors.blueAccent,
                            height: 2.h,width: 15.w,),
                            
                                                   Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalFee}"),
                                                   ),
                                                 ],
                                               ),
                         ),
                           Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Container(
                            color: Colors.green,
                            height: 2.h,width: 50.w,),
                            
                                                   Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalTransactionSuccess}"),
                                                   ),
                                                 ],
                                               ),
                         ),

                           Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Container(
                            color: Colors.greenAccent,
                            height: 2.h,width: 50.w,),
                     
                                                   Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalAmountSuccess}"),
                                                   ),
                                                 ],
                                               ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Container(
                            color: Colors.orange,
                            height: 2.h,width: 10.w,),
                     
                                                   Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalTransactionPending}"),
                                                   ),
                                                 ],
                                               ),
                         ),
                           Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Container(
                            color: Colors.orangeAccent,
                            height: 2.h,width: 10.w,),
                     
                                                   Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalAmountPending}"),
                                                   ),
                                                 ],
                                               ),
                         ),
                           Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Container(
                            color:  Colors.red,
                            height: 2.h,width: 3.w,),
                     
                                                   Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalAmountFailed}"),
                                                   ),
                                                 ],
                                               ),
                         ),
                           Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Container(
                            color: Colors.redAccent,
                            height: 2.h,width: 3.w,),
                     
                                                   Container(
                            child: Text("${controllerStatistiqueUser.dataStatistique!.totalTransactionFailed}"),
                                                   ),
                                                 ],
                                               ),
                         ),


                         Row(
                           children: [
                             Text("Legende:",
                             style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                             ),
                             ),
                           ],
                         ),
                          SizedBox(height: 5,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Violet : Total transaction "),
                             Container(height: 10,width: 10, color: VioletPureColor,)
                           ],
                         ),
                        SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Bleu : Total Amount "),
                             Container(height: 10,width: 10, color: Colors.blue,)
                           ],
                         ),
                          SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Bleu Accent : Total Fee "),
                             Container(height: 10,width: 10, color: Colors.blueAccent,)
                           ],
                         ),
                          
                          SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Vert : Total Transaction Success "),
                             Container(height: 10,width: 10, color: Colors.green)
                           ],
                         ),
                                               SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Vert claire : Total Amount Success "),
                             Container(height: 10,width: 10, color: Colors.greenAccent)
                           ],
                         ),
                                              SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Orange : Total Transaction Pending "),
                             Container(height: 10,width: 10, color: Colors.orange)
                           ],
                         ),
                                               SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Orange claire : Total Amount Pending "),
                             Container(height: 10,width: 10, color: Colors.orangeAccent)
                           ],
                         ),
                       
                                                     SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Rouge claire : Total Amount Failed "),
                             Container(height: 10,width: 10,   color: Colors.red,)
                           ],
                         ),
                                                      SizedBox(height: 3,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Rouge claire : Total Transaction Failed "),
                             Container(height: 10,width: 10,   color: Colors.redAccent,)
                           ],
                         ),
                         SizedBox(height: 5,),
                  ],
                ),
              );
            }),
        ),
      )),
    );
  }
}
