// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key, required this.controller});
//   final WebViewController controller;

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//  var loadingPercentage=0;

//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     widget.controller.setNavigationDelegate(NavigationDelegate(
//       onPageStarted: (url) {
//         setState(() {
//           loadingPercentage=0;
//         });
//       },
//       onProgress: (progress) {
//         setState(() {
//           loadingPercentage=progress;
//         });
//       },
//       onPageFinished:(url) {
//           setState(() {
//           loadingPercentage=100;
//         });
//       },
      
//     ),
    
//     )..setJavaScriptMode(JavaScriptMode.unrestricted)..addJavaScriptChannel("SnackBar");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }