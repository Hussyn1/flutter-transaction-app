import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:transaction_application/ui/pages/bottomnavPage/bottomnav.dart';
import 'package:transaction_application/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Transaction Application',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: BottomNavPage(),
    );
  }
}
