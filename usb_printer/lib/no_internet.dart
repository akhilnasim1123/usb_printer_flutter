import 'dart:async';

import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
// import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class noInternet extends StatefulWidget {
  const noInternet({super.key});

  @override
  State<noInternet> createState() => _noInternetState();
}

class _noInternetState extends State<noInternet> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => noInternet()));
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('images/nointernet.json', width: 200),
            Text(
              'No Internet',
              style: TextStyle(
                  color: Color.fromARGB(255, 1, 43, 65),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('Check your internet connection!'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (isDeviceConnected == true) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebViewApp(),
                            ));
                      }
                    },
                    child: Text('Reload'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[900],
                    )),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('Close'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
