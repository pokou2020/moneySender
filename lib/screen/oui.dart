


// // ignore_for_file: unnecessary_null_comparison

// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// //  import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:webview_flutter/webview_flutter.dart';


// class WebviewWidget extends StatefulWidget {
//   const WebviewWidget({Key key}) : super(key: key);

//   @override
//   State<WebviewWidget> createState() => _WebviewWidgetState();
// }

// class _WebviewWidgetState extends State<WebviewWidget> {
//   bool isOnline = true;
//   void checkOnline() async {
//     isOnline = await InternetConnectionChecker().hasConnection;
//   }

//   @override
//   void initState() {
//     checkOnline();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isOnline
//         ? const WebView(
//             initialUrl: "https://artsify.in",
//             javascriptMode: JavascriptMode.unrestricted,
//           )
//         : Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Ooops, connection lost"),
//                 ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         checkOnline();
//                       });
//                     },
//                     child: const Text("Try again")),
//               ],
//             ),
//           );
//   }
// }