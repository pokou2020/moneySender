import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moneysender/screen/homeMoneysender.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller=AnimationController(vsync: this, duration: Durations.extralong1);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       
        children: [
           Lottie.asset("assets/images/welcom.json",
       
          fit: BoxFit.cover,
          repeat: true,
          controller: _controller,
          onLoaded: (compos){
            _controller..duration=compos.duration..forward().then((value){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMoneysender()));
            });
          }),
          
          Lottie.asset("assets/images/confettie.json",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width ,
          fit: BoxFit.cover,
          repeat: true,
          controller: _controller,
          onLoaded: (compos){
            _controller..duration=compos.duration..forward().then((value){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMoneysender()));
            });
          }
          ),

             Center(
               child: Lottie.asset("assets/images/travel.json",
                         controller: _controller,
                         repeat: true,
                         onLoaded: (compos){
                           _controller..duration=compos.duration..forward().then((value){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMoneysender()));
                           });
                         }
                         ),
             ),  
        ],
      ),
    );
  }
}