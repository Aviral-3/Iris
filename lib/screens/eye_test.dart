import 'dart:math';

import 'package:eyefit_Iris/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../constants/constants.dart';
import '../constants/my_drawer.dart';

class EyeTestScreen extends StatefulWidget {
  const EyeTestScreen({Key? key}) : super(key: key);

  @override
  State<EyeTestScreen> createState() => _EyeTestScreenState();
}

class _EyeTestScreenState extends State<EyeTestScreen> {
  final TextEditingController _controller = TextEditingController();

  String text = "";
  double fontSize = 100;
  final alphabets = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  void takeTest() {
    if (fontSize == 20) {
      final tts = TextToSpeech();
      tts.speak('you have a great eye sight, congratulations!');
      moveScreen(context, true, HomeScreen());
    } else {
      fontSize = fontSize - 5;
    }

    final i = Random().nextInt(alphabets.length);
    text = alphabets[i];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tts = TextToSpeech();
    tts.speak(
        'Keep your phone at the arm distance but don\'t push the limits!, enter the letter shown and click check button');
    takeTest();
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
                  child: Text('Eye Test',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 32,
                      )),
                ),
                const SizedBox(height: 10),
                Text(
                  '${text.toUpperCase()}',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: fontSize,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter the letter',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    final tts = TextToSpeech();
                    if (text == _controller.text) {
                      _controller.text = "";
                      takeTest();
                    } else {
                      tts.speak('Nah! not that one, try harder!');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          HexColor("#e01455"),
                          HexColor("#8c0630"),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: size.height * 0.06,
                    alignment: Alignment.center,
                    child: Text('Check',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
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
