import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../constants/constants.dart';
import '../constants/my_drawer.dart';

class PalmExercise extends StatefulWidget {
  const PalmExercise({Key? key}) : super(key: key);

  @override
  State<PalmExercise> createState() => _PalmExerciseState();
}

class _PalmExerciseState extends State<PalmExercise> {
  int seconds = 30;
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
      seconds = 30;
    });
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tts = TextToSpeech();
    tts.speak(
        'You need to rub your palms for 30 seconds and put them over your eyes, but hey! make sure you don\'t harm your eyes!, doing this exercise daily will improve your vision');
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
                  height: 30,
                ),
                Text(
                  'Palm Exercise',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    width: size.width * 0.6,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/premium-vector/ashamed-disappointed-man-covering-his-face-flat-vector-illustration-isolated_181313-1585.jpg?w=2000'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Center(
                    child: Text(
                      'You need to rub your palms for 30 seconds and put them over your eyes, but hey! make sure you don\'t harm your eyes!, doing this exercise daily will improve your vision',
                      style: GoogleFonts.lato(
                          color: Colors.grey[200],
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: seconds / 30,
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
                              height: 5,
                            ),
                            seconds == 0
                                ? Center(child: Icon(Icons.done))
                                : Center(
                                    child: Text(
                                      '$seconds',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
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
