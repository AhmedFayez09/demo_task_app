import 'package:flutter/material.dart';
import 'package:flutter_application_1/mvc/view/screens/home_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await _isAndroidPermissionGranted();
  runApp(const MyApp());
}

Future<void> _isAndroidPermissionGranted() async {
  if (await Geolocator.isLocationServiceEnabled() == false) {
    // print(
    //     " isLocationServiceEnabled : ${await Geolocator.isLocationServiceEnabled()}");
    await Geolocator.openLocationSettings();
    // await Geolocator.openAppSettings();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      // routes: {
      //   '/home' : (ctx)=> HomeScreen(),
      // },
      
    );
  }
}
