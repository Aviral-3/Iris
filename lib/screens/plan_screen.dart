import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constants/my_drawer.dart';

class PlanMakerScreen extends StatefulWidget {
  const PlanMakerScreen({Key? key}) : super(key: key);

  @override
  State<PlanMakerScreen> createState() => _PlanMakerScreenState();
}

class _PlanMakerScreenState extends State<PlanMakerScreen> {
  bool veg = true;
  bool healthyFood = true;

  var vegThing;
  var nonVegThing;
  var snackThing;
  var healthyThing;

  bool showCard = false;

  void makePlan() {
    const vegFood = [
      "kale",
      "spinach",
      "turnip greens",
      "collard greens",
      "corns",
    ];

    const non_veg = [
      "tuna",
      "salmon",
      "trout",
      "meat",
      "chicken",
    ];

    const healthy = ["carrot", "orange", "apple", "barley", "spinach"];
    const snacks = ["almonds", "nuts", "berries", "cutlets", "pudding"];
    final random = new Random();

    if (veg == true) {
      final i = random.nextInt(vegFood.length);
      vegThing = vegFood[i];
    } else if (veg == false) {
      final i = random.nextInt(non_veg.length);
      nonVegThing = non_veg[i];
    }

    if (healthyFood == true) {
      final i = random.nextInt(healthy.length);
      healthyThing = healthy[i];
    } else {
      final i = random.nextInt(snacks.length);
      snackThing = snacks[i];
    }
    setState(() {
      showCard = true;
    });
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
                  child: Text(
                    'Let\'s get the best and \nhealthy meal for your eyes!',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Choose the following things!',
                    style: GoogleFonts.poppins(
                      color: Colors.deepPurple[100],
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        veg = true;
                        setState(() {});
                      },
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          gradient: veg == true
                              ? LinearGradient(
                                  colors: [
                                    HexColor("#960058"),
                                    HexColor("#820021"),
                                  ],
                                )
                              : LinearGradient(
                                  colors: [
                                    HexColor("#630051"),
                                    HexColor("#96027b"),
                                  ],
                                ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'VEG',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        veg = false;
                        setState(() {});
                      },
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          gradient: veg == false
                              ? LinearGradient(
                                  colors: [
                                    HexColor("#960058"),
                                    HexColor("#820021"),
                                  ],
                                )
                              : LinearGradient(
                                  colors: [
                                    HexColor("#630051"),
                                    HexColor("#96027b"),
                                  ],
                                ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'NON-VEG',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        healthyFood = true;
                        setState(() {});
                      },
                      child: Container(
                        width: size.width * 0.48,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          gradient: healthyFood == true
                              ? LinearGradient(
                                  colors: [
                                    HexColor("#960058"),
                                    HexColor("#820021"),
                                  ],
                                )
                              : LinearGradient(
                                  colors: [
                                    HexColor("#630051"),
                                    HexColor("#96027b"),
                                  ],
                                ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'HEALTHY FOOD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        healthyFood = false;
                        setState(() {});
                      },
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                          gradient: healthyFood == false
                              ? LinearGradient(
                                  colors: [
                                    HexColor("#960058"),
                                    HexColor("#820021"),
                                  ],
                                )
                              : LinearGradient(
                                  colors: [
                                    HexColor("#630051"),
                                    HexColor("#96027b"),
                                  ],
                                ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'SNACKS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        showCard = true;
                      });
                      makePlan();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Make a plan!',
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            HexColor("#eb0037"),
                            HexColor("#85001f"),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(33),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Opacity(
                  opacity: showCard == true ? 1 : 0,
                  child: Container(
                    width: 250,
                    height: 250,
                    color: Colors.black,
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              HexColor("#c92029"),
                              HexColor("#8f0109"),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                              ),
                              fit: BoxFit.cover,
                              height: 120,
                              width: 250,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 0.4,
                              height: 2,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: size.height * 0.04,
                              alignment: Alignment.center,
                              child: veg == true
                                  ? Text(
                                      '$vegThing',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Text(
                                      '$nonVegThing',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor("#a0a600"),
                                    HexColor("#6a6e04"),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'And',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: size.height * 0.04,
                              alignment: Alignment.center,
                              child: healthyFood == true
                                  ? Text(
                                      '$healthyThing',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Text(
                                      '$snackThing',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor("#6a6e04"),
                                    HexColor("#a0a600"),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ],
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
