import 'package:flutter/material.dart';
import 'package:latihan_shared_preferences/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder(
                future: getName(),
                builder: (context, AsyncSnapshot snapshot) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset:
                              const Offset(1, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 35,
                          ),
                          radius: 40,
                          backgroundColor: Color.fromARGB(255, 179, 0, 255),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data ?? '',
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 179, 0, 255)),
                  onPressed: () async {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: Text('LogOut ')),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 179, 0, 255),
        title: Text("Home PAge"),
      ),
    );
  }

  Future<String?> getName() async {
    final SharedPreferences preff = await SharedPreferences.getInstance();
    return preff.getString('username')!;
  }
}
