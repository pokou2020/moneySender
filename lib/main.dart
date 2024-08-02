import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moneysender/providers/StatistiqueUserProvider.dart';
import 'package:moneysender/providers/recentPayementProvider.dart';
import 'package:moneysender/providers/recenteTransaction_provider.dart';
import 'package:moneysender/providers/userInfo_provider.dart';
import 'package:moneysender/screen/connexion.dart';
import 'package:moneysender/screen/controller/dependency_inject.dart';
import 'package:moneysender/screen/firstPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


void main() {

  runApp(
       MultiProvider(
      providers: [
        ChangeNotifierProvider<RecenteTransactionProvider>(create: (_) => RecenteTransactionProvider()),
         ChangeNotifierProvider<RecentePayementProvider>(create: (_) => RecentePayementProvider()),
         ChangeNotifierProvider<StatistiqueUserProvider>(create: (_) => StatistiqueUserProvider()),
         ChangeNotifierProvider<UserinfoProvider>(create: (_) => UserinfoProvider())
      ],
      child: MyApp(),
    ),
  );
    // DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  // final _navkey= GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
         
            primarySwatch: Colors.blue,
          ),
          // home: const RestoAcceuil(),
         // home: const Bottonbarpage(),
        // home: const BottomBarPageDivers(),
         home:  const FirstPage(),
        );
      }
    );
  }
}



