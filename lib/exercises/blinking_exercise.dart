import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyefit_Iris/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../constants/my_drawer.dart';

class BlinkingExercise extends StatefulWidget {
  const BlinkingExercise({Key? key}) : super(key: key);

  @override
  State<BlinkingExercise> createState() => _BlinkingExerciseState();
}

class _BlinkingExerciseState extends State<BlinkingExercise> {
  int seconds = 180;
  Timer? timer;

  void decreaseTime() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          final tts = TextToSpeech();
          exercise = exercise + 1;
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
              .update({"exercise": exercise});
          String text =
              "Congratulations!, number of exercises has been increased! you have the chance to make your eyes new again!";
          tts.speak(text);
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      seconds = 180;
    });
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tts = TextToSpeech();
    String text =
        "Hello, You need to do blinking exercise for continuous 3 minutes every day for good health of your eyes! You can start by clicking the start button for a timer of 3 minutes or 180 seconds";
    tts.speak(text);
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
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://png.pngtree.com/png-clipart/20210214/ourlarge/pngtree-open-cartoon-eyes-clipart-black-and-white-png-image_2921132.jpg'),
                        height: 120,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Image(
                        image: NetworkImage(
                            'https://media.istockphoto.com/id/1208436411/vector/abstract-closed-eyes-with-lashes.jpg?s=612x612&w=0&k=20&c=sh2DtNhz2GBCoS10F8HbB92Lisv-lVeySp2jixziw_I='),
                        height: 120,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Blink your eyes rapidly',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Center(
                    child: Text(
                      'You need to blink your eyes for total of 180 seconds (3 minutes) relax temporarily and do daily for 3 mins',
                      style: GoogleFonts.poppins(
                          color: Colors.grey[200], fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: seconds / 180,
                        valueColor: AlwaysStoppedAnimation(
                          Colors.white,
                        ),
                        strokeWidth: 12,
                        backgroundColor: Colors.greenAccent,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 55,
                            ),
                            seconds == 0
                                ? Center(child: Icon(Icons.done))
                                : Center(
                                    child: Text(
                                      '$seconds',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 36,
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 55,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    decreaseTime();
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'START',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w300),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          HexColor("#2b0099"),
                          HexColor("#9a00d9"),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    stopTimer();
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'STOP',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w300),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          HexColor("#2b0099"),
                          HexColor("#9a00d9"),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
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
