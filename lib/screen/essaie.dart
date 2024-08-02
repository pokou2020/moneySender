

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:webview_flutter/webview_flutter.dart';


class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final WebViewController controller;
  // late bool _isLoading;

  

  @override
void initState() {
    // TODO: implement initState

          // _isLoading=true;
        
      //  Future.delayed(const Duration(seconds: 2),(){
      // setState(() {
      //   _isLoading=false;
      // });
      //  });
    
  super.initState();
    //  WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown
    //   ]
    //   );  
     controller=WebViewController()..loadRequest(Uri.parse("https://google.com"));
  }
//   @override
// dispose() {
//   SystemChrome.setPreferredOrientations([
  
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   super.dispose();
// }
  @override
  Widget build(BuildContext context) {

   
      WebViewController newcontroller = WebViewController();
     newcontroller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
     
        if (request.url.startsWith("https://www.google.com")) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://moneysender.doubleclic-tech.com'));
  

 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("WebView", 
        style: TextStyle(
          color: Colors.black
        ),
        ),

        actions: [
          Row(
            children: [
              IconButton(onPressed: ()async{
              final messenger = ScaffoldMessenger.of(context);
              if (await controller.canGoBack()) {
                await controller.goBack();
              } else {
                messenger.showSnackBar(SnackBar(content: Text("No back")));
                return;
              }
              }, 
              icon: Icon(Icons.arrow_back_ios, color: Colors.black)),

                IconButton(onPressed: ()async{
              final messenger = ScaffoldMessenger.of(context);
              if (await controller.canGoBack()) {
                await controller.goBack();
              } else {
                messenger.showSnackBar(SnackBar(content: Text("No back")));
                return;
              }
              }, 
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black)),

              IconButton(onPressed: (){

              }, icon: Icon(Icons.replay, color: Colors.black,))
              
            ],
          )
        ],

      ),

      body: WebViewWidget(controller: controller),
       
      //   body:  _isLoading ? Center(child: CircularProgressIndicator(),): OrientationBuilder(builder: (context, orientation)=>
      //    orientation== Orientation.landscape? 
      //    WebViewWidget(controller: newcontroller)
      //    :WebViewWidget(controller: newcontroller)
      // )
      //  
       );


    //     Widget buildPortrait(){
    //       return  WebViewWidget(controller: newcontroller);
    //     }
    //  Widget buildLanscape(){
    //       return  WebViewWidget(controller: newcontroller);
    //     }
    
  }

//         Stack(
//   children: [
//      Image(image: AssetImage("assets/appbgg.png"),fit: BoxFit.fill),
//           Positioned(
      
//             bottom: 25,
           
//             left: 20,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text('Info Time Table Student',style: TextStyle(
//                           fontFamily: "Gilroy Medium",
//                           fontSize: 18,
//                           color: WhiteColor,
//                           fontWeight: FontWeight.bold
//                           )),
//                            InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Icon(Icons.close,
//                               size: 28,
//                               color: WhiteColor,
//                               semanticLabel: "yagnuilk")),
//         ],
//       ),
//     ),
       
//   ],
// ),
}

