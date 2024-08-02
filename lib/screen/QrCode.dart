import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/constant.dart';
import 'package:sizer/sizer.dart';
class Qrcode extends StatefulWidget {
  final String? serial_number,station_id,company_id;
  const Qrcode({super.key, required this.serial_number,required this.station_id,required this.company_id});

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  final GlobalKey globalKey = GlobalKey();
  String qrdata="";

  @override
  void initState() {
    // TODO: implement initState
  // _getQrcode();
    super.initState();
  }

  // TextEditingController datajsonQrcode=TextEditingController();

  String? datajsonQrcode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        actions: [
       
        ],
      ),
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImageView(
                  data: "https://moneysender.doubleclic-tech.com/lineGare/${widget.serial_number}/${widget.company_id}/${widget.station_id}",
                  version: QrVersions.auto,
                  size: 300,
                  gapless: true,
                  errorStateBuilder: (cxt, err) {
                    return const Center(
                      child: Text("Error"),
                    );
                  },
                ),
              ),
            ),

           
          ],
        ),
      ),
    );
  }


}
