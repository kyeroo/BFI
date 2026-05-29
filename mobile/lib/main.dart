import 'package:flutter/material.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/screens/register_screen.dart';
import 'package:mobile/screens/tpsr/tpsr_dashboard_screen.dart';
import 'package:mobile/screens/tpsr_dashboard.dart';

import 'core/theme.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: TpsrDashboardScreen(),
    );
  }
}