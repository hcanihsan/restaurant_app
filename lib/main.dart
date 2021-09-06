import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/list_restaurant.dart';
import 'package:restaurant_app/common/theme/styles.dart';
import 'package:restaurant_app/provider/list_restaurant_provider.dart';

import 'api/service_api.dart';

void main() {
  // Kode untuk Orientasi Layar Portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Restaurant INDONESIA",
      theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: secondColor,
          textTheme: textThemeApp,
          appBarTheme: AppBarTheme(
              textTheme: textThemeApp.apply(bodyColor: primaryColor))),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  loadingSplash() {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navIntro);
  }

  navIntro() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChangeNotifierProvider<ListRestaurantProvider>(
                  create: (_) =>
                      ListRestaurantProvider(serviceAPIList: ServiceAPI()),
                  child: RestaurantScreen(),
                )));
  }

  @override
  void initState() {
    loadingSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'images/splash_screen.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
