import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyefit_Iris/constants/constants.dart';
import 'package:eyefit_Iris/screens/plan_screen.dart';
import 'package:eyefit_Iris/widgets/exercise.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/my_drawer.dart';
import 'eye_mission.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getData() async {
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
        .get()
        .then((DocumentSnapshot snapshot) async {
      name = snapshot.get('name');
      email = snapshot.get('email');
      exercise = snapshot.get('exercise');
      meditation = snapshot.get('meditation');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
            height: size.height * 0.95,
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
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 18.0,
                              top: 32.0,
                            ),
                            child: Text(
                              'Hey there, Armaan',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0, left: 20),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings,
                                color: Colors.grey[300],
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18.0,
                          top: 6.0,
                        ),
                        child: Text(
                          '22 January, 2023',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {
                    moveScreen(context, false, EyeMissionScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    height: size.height * 0.2,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1524088484081-4ca7e08e3e19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=491&q=80'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'OUR EYES\nMISSION!',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.23,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text('View a suitable diet plan for yourself!',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Good diet plan helps your eyes to be better and provide more VITAMIN-A which increases your vision!',
                        style: GoogleFonts.roboto(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          moveScreen(context, false, PlanMakerScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 70,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Make a plan',
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: HexColor("#08024a"),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      HexColor(
                        "#6b008f",
                      ),
                      HexColor("#38024a"),
                    ]),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Text('Some preferred eye exercises for you...',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Exercise(
                          image:
                              "https://images.unsplash.com/photo-1516585303056-5697400f461d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bG9uZWxpbmVzcyUyMGV5ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
                          exerciseText: 'Blinking Exercise',
                        ),
                        Exercise(
                          exerciseText: 'Palm Exercise',
                          image:
                              'https://plus.unsplash.com/premium_photo-1669532597169-90e42c3e5dcc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cnViYmluZyUyMGV5ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
                        ),
                        Exercise(
                          exerciseText: 'Eye moving Exercise',
                          image:
                              'https://images.unsplash.com/photo-1524499982521-1ffd58dd89ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZXllcyUyMHJpZ2h0JTIwYW5kJTIwbGVmdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text('Coming Soon...',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                        const SizedBox(
                          width: 15,
                        )
                      ],
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
