import 'package:flutter/material.dart';
import 'package:latihan_shared_preferences/controller/auth_controller.dart';
import 'package:latihan_shared_preferences/home_page.dart';
import 'package:latihan_shared_preferences/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              controller: _authController.controllerUsername,
              icon: Icons.account_circle,
              hintText: 'Username',
              labelText: 'Username',
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 15,
            ),
            MyTextField(
              controller: _authController.controllerPAssword,
              showPass: showPass,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    showPass = !showPass;
                  });
                  // print(showPass);
                },
                child: Icon(showPass ? Icons.visibility : Icons.visibility_off),
              ),
              icon: Icons.lock,
              hintText: 'Password',
              labelText: 'Password',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonLogin(dipencent: () async {
              await _authController
                  .login(_authController.controllerUsername.text,
                      _authController.controllerPAssword.text)
                  .then((value) {
                print(value);
                value
                    ? Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ))
                    : print('gagal');
              });
              // print(_authController.controllerPAssword.text.runtimeType);
            })
          ],
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  VoidCallback dipencent;
  ButtonLogin({
    required this.dipencent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // style: ButtonStyle(elevation: MaterialStateProperty),
      // style: ButtonStyle(backgroundColor: Color(12212122)),
      onPressed: dipencent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
