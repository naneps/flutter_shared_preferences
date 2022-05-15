import 'package:flutter/material.dart';
import 'package:latihan_shared_preferences/home_page.dart';
import 'package:latihan_shared_preferences/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preff = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Shared Preferences',
    theme: ThemeData(primarySwatch: Colors.amber),
    home: (preff.getBool('isLogin')!) ? const LoginScreen() : const HomePage(),
  ));
}
