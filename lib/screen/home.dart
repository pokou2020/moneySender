

// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
//  import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late bool _isLoading;
    late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
          _isLoading=true;
       Future.delayed(const Duration(seconds: 2),(){
      setState(() {
        _isLoading=false;
      });
       });
    
    super.initState();
     WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
      ]
      ); 
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            // showDialogBox();
            setState(() => isAlertSet = true);
           print("//////////////subscription///////////");
            print(subscription);
            print("//////////////subscription///////////");
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
      SystemChrome.setPreferredOrientations([
  
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  }




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
    
       
        body: !isDeviceConnected && isAlertSet == false?Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Oups, vérifiez votre connexion internet',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            
            ),
            )),
            SizedBox(height: 30,),
            ElevatedButton(
                    onPressed: () {
                      setState(() {
                       getConnectivity();
                      });
                    },
                    child: const Text("Réessayer")),
          ],
        ):  OrientationBuilder(builder: (context, orientation)=>
         orientation== Orientation.landscape? 
         WebViewWidget(
          
          controller: newcontroller
          )
         :WebViewWidget(controller: newcontroller)
      )
        );


    
   
    
  }
showDialogBox() => Container(
  height: MediaQuery.of(context).size.height,
  color: Colors.white,
  child:  CupertinoAlertDialog(
          title: Text('Pas de connection'),
          content: const Text('Veuillez vérifier votre connection Internet'),
          actions: <Widget>[
            // TextButton(
            //   onPressed: () async {
               
            //     setState(() => isAlertSet = false);
            //     isDeviceConnected =
            //         await InternetConnectionChecker().hasConnection;
            //     if (!isDeviceConnected && isAlertSet == false) {
            //       showDialogBox();
            //       setState(() => isAlertSet = true);
            //     }
              
           
          
              
            //   },
            //   child: const Text(""),
            // ),
          ],
        ),
 );


}





