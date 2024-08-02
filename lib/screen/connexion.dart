import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../util/constant.dart';
import 'home.dart';
import 'homeMoneysender.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();
  bool _loader = false;
  bool _showPassword = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chekLogin();
  }

  
  void chekLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('access_token');

    if (val != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeMoneysender(
                  // first_name:widget.first_name
                  )));
    }
  }
  var usernameController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//0749485326


    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           "assets/images/Mobi.png",
        //         ),
        //         fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 1.2,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Logo2.png"),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Connectez-vous à votre",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Center(
                              child: Text(
                                "compte ",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ))),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.3,
                      color: Color.fromARGB(255, 212, 211, 211),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            hintText: 'Téléphone',
                            prefixIcon: Icon(Icons.phone_android_outlined)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.3,
                      color: Color.fromARGB(255, 212, 211, 211),
                      child: Center(
                        child: TextFormField(
                          obscureText: !_showPassword,
                          validator: (val) =>
                              val!.length < 4 ? "Password too short" : null,
                          controller: passController,
                          decoration: InputDecoration(
                            hintText: 'Mot de passe',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                                icon: _showPassword
                                    ? Icon(
                                        Icons.visibility_outlined,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              "Mot de passe oublié",
                              style:
                                  GoogleFonts.poppins(color: VioletPureColor),
                            ),
                          ),
                          Icon(Icons.arrow_right_alt)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    InkWell(
                  onTap:   !_loader ? login: () {
                         Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        HomeMoneysender(),
                                transitionDuration: Duration(milliseconds: 700),
                                reverseTransitionDuration:
                                    Duration(milliseconds: 700),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(
                                      1.0, 0.0); //position de la page i,nitial
                                  const end = Offset.zero; //l'ancienne page
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                                // builder: (context)=>Connexion()
                              ));
                        //  Navigator.removeRoute(context, MaterialPageRoute(builder: (context)=>Connexion()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Connexion()));
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Center(
                          child: Text(
                            "Connectez-vous",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: VioletPureColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    if (passController.text.isNotEmpty && usernameController.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse("https://payvortex.doubleclic-tech.com/auth/token"),
        body: ({
          'username': usernameController.text,
          'password': passController.text
        }),
      );

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();

      print("=== requete ===");
      print("=== requete ===");
      print(usernameController.text);
      print(passController.text);
      print(response.body);
      print("=== requete ===");
      print("=== requetes ===");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("access_token", body['access_token']);
         SharedPreferences refreshtoken = await SharedPreferences.getInstance();
        await refreshtoken.setString("refresh_token", body['refresh_token']);
      print("/////////////refreshtoken:::://///");
       print(refreshtoken);
        print(pref);
       print("/////////////refreshtoken:::://///");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeMoneysender()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid password or username")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please fill in the input fields")));
      Navigator.of(context).pop();
    }
  }
}
