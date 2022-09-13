import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:newsapi_project/screens/splash_screen.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  TextEditingController emailController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome',
                style: GoogleFonts.akayaKanadaka(
                    color: Colors.purple,
                    fontSize: 45,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.email,
                        color: Colors.deepPurple,
                      ),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child:
                  Text('login', style: GoogleFonts.akayaKanadaka(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  fixedSize: const Size(80, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    var magic = Magic.instance;
    var token =
        await magic.auth.loginWithMagicLink(email: emailController.text);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }
}
