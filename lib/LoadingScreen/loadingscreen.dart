import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:valorex/HomePage/HomePage.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: intScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  intScreen(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF0d0d0d),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF0d0d0d),
          body: Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Neon_Valoran.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SpinKitSpinningLines(
                      color: Colors.red,
                      size: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Connecting to Servers',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Valorant1",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing:0),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
