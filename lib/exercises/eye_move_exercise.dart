import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../constants/constants.dart';
import '../constants/my_drawer.dart';

class EyeMovingExercise extends StatefulWidget {
  const EyeMovingExercise({Key? key}) : super(key: key);

  @override
  State<EyeMovingExercise> createState() => _EyeMovingExerciseState();
}

class _EyeMovingExerciseState extends State<EyeMovingExercise> {
  int seconds = 150;
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
      seconds = 150;
    });
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tts = TextToSpeech();
    tts.speak(
        'You need to move your eyes to the extreme positions, don\'t try to push the limits! this will help you to recover from eye redness which is swollen eye muscles and veins plus it increases your eye\'s strength');
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
                Center(
                  child: Text(
                    'Eye Moving Exercise',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: size.width * 0.6,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://thumbs.dreamstime.com/b/eye-exercise-movement-eyes-relaxation-eyeball-eyelash-brow-isolated-vector-illustration-cartoon-style-144977529.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Center(
                    child: Text(
                      'You need to move your eyes to the extreme positions, don\'t try to push the limits! this will help you to recover from eye redness which is swollen eye muscles and veins plus it increases your eye\'s strength, you need to do this daily for or 150 seconds per time',
                      style: GoogleFonts.lato(
                          color: Colors.grey[200],
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: seconds / 150,
                        valueColor: AlwaysStoppedAnimation(
                          Colors.white,
                        ),
                        strokeWidth: 10,
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
                                        fontSize: 36,
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
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
