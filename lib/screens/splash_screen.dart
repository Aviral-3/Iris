import 'package:firebase_auth/firebase_auth.dart';

import 'auth/login_screen.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: size.height * 0.95,
            decoration: BoxDecoration(
              color: Colors.blue[200],
            ),
            child: Column(
              children: [
                const SizedBox(height: 200),
                Center(
                  child: Text(
                    'EyeFit',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 0),
                Center(
                  child: Text(
                    'Keep your eyes fit!',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            FirebaseAuth.instance.currentUser != null
                                ? HomeScreen()
                                : LoginScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: Card(
                      // semanticContainer: true,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      elevation: 2.0,
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          color: HexColor("#6246ea"),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'CONTINUE ->',
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
