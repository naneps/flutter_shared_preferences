import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPAssword = TextEditingController();

  Future<bool> login(String uname, String pw) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String username = '';
    String password = '';
    for (var user in users) {
      if (user['username'] == uname && user['password'] == pw) {
        preferences.setBool('isLogin', true);
        preferences.setString('username', uname);
        username = user['username']!;
        password = user['password']!;
      }
    }
    if (username == uname && password == pw) {
      return true;
    } else {
      return false;
    }
  }

  logout() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isLogin', false);
  }
}

List<Map<String, String>> users = [
  {
    'username': 'nann',
    'password': 'nann',
  },
  {
    'username': 'prass',
    'password': 'prass',
  },
  {
    'username': 'admin',
    'password': 'admin',
  },
];


  // function login from local
  

