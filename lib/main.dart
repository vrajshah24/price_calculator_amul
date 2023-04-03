import 'package:flutter/material.dart';
import 'package:price_calculator_amul/screens/login.dart';

import 'screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    routes: {
      // '/': (context) => const SplashScreen(),
      '/': (context) => const Login(),
    },
  ));
}
