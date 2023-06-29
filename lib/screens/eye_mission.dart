import 'package:eyefit_Iris/constants/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class EyeMissionScreen extends StatelessWidget {
  const EyeMissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('EyeFit'),
        centerTitle: true,
        backgroundColor: HexColor("#14004f"),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: size.height * 0.9,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HexColor(
                    "#27007a",
                  ),
                  HexColor("#c2a7fc"),
                ],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text('EyeFit Eyes Mission!',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 32,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'EYES ARE DELICATE!',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 3,
                          thickness: 1,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Let\'s all come together, do exercises, decrease screen time, improve mental health and be fit!',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1540162875225-3f6b56d69fe8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZXllcyUyMG1pc3Npb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.only(left: 18),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'OUR GOALS',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18,
                  ),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    '-To decrease eye illnesses',
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18,
                  ),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    '-To increase awareness',
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18,
                  ),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    '-To increase mental fitness',
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18,
                  ),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Text(
                    '-To keep everyone fit and healthy!',
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [HexColor("#de2663"), HexColor("#ab001c")],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: Text('Be a part of it!',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        )),
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
