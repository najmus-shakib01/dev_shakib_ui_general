import 'package:flutter/material.dart';
import 'package:general/General/app_permission_screen.dart';

void main() {
  runApp(const ReferableApp());
}

class ReferableApp extends StatelessWidget {
  const ReferableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'General Referral App',
      home: const AppPermissionScreen(),
    );
  }
}