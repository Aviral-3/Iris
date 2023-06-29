import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../constants/constants.dart';
import '../constants/my_drawer.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  int seconds = 600;
  Timer? timer;
  final player = AudioPlayer();

  void decreaseTime() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      player.play(
        AssetSource('sound.mp3'),
      );
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          player.stop();
          final tts = TextToSpeech();
          String text =
              "Congratulations!, number of meditations done has been increased!";
          meditation = meditation + 1;
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
              .update({"meditation": meditation});
          tts.speak(text);
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    player.stop();
    setState(() {
      seconds = 600;
    });
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tts = TextToSpeech();
    tts.speak(
        'Let\'s do some meditation today! close your eyes and focus! it will improve your focus as well as your eye-sight');
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
                        'MEDITATION',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 42,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'The Key To Success',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 250,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1512438248247-f0f2a5a8b7f0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWVkaXRhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12),
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
                            value: seconds / 600,
                            valueColor: AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                            strokeWidth: 6,
                            backgroundColor: Colors.blue,
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
        ),
      ),
    );
  }
}
