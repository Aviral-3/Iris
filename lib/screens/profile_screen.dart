import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/constants.dart';
import '../constants/my_drawer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.16,
                  margin: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        HexColor("#2b05a8"),
                        HexColor("#1e0278"),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 12),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1474533410427-a23da4fd49d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGV5ZXMlMjByaWdodCUyMGFuZCUyMGxlZnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60"),
                          radius: 38,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Armaan',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 5),
                            Text('armaan33000@gmail.com',
                                style: GoogleFonts.poppins(
                                  color: Colors.deepPurple[100],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: size.height * 0.2,
                  margin: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        HexColor("#230094"),
                        HexColor("#10023d"),
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: Text(
                          'STATS',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'Number of Meditations: $meditation',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'Number of Exercises: $exercise',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Center(
                    child: Text(
                        'Do as many exercises and sessions of meditations as you can , to keep yourself healthy! and encourage others by sending the screenshots as well as spreading awareness, be fit!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.deepPurple[100],
                          fontSize: 16,
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
