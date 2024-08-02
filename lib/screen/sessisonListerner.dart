import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SessionListener extends StatefulWidget {
  Widget child;
  Duration duaration;
  VoidCallback onTimeOut;
   SessionListener({super.key, required this.child, required this.duaration, required this.onTimeOut});

  @override
  State<SessionListener> createState() => _SessionListenerState();
}

class _SessionListenerState extends State<SessionListener> {

Timer?_timer;

_startTime(){
  print("Time reset");
if(_timer != null){
  _timer?.cancel();
  _timer=null;
}

_timer=Timer(widget.duaration, (){
print("object1");
widget.onTimeOut();
});
}

@override
  void initState() {
    // TODO: implement initState
    _startTime();
    super.initState();
  }

  @override
  void dispose() {
    if(_timer != null){
  _timer?.cancel();
  _timer=null;
}
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) =>_startTime() ,
      child: widget.child,
    );
  }
}