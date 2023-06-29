import 'package:eyefit_Iris/constants/constants.dart';
import 'package:eyefit_Iris/exercises/blinking_exercise.dart';
import 'package:eyefit_Iris/exercises/eye_move_exercise.dart';
import 'package:eyefit_Iris/exercises/palm_exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Exercise extends StatelessWidget {
  final exerciseText;
  final image;
  const Exercise({Key? key, required this.exerciseText, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        if (exerciseText == "Blinking Exercise") {
          moveScreen(context, false, BlinkingExercise());
        } else if (exerciseText == "Palm Exercise") {
          moveScreen(context, false, PalmExercise());
        } else {
          moveScreen(context, false, EyeMovingExercise());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        height: size.height * 0.18,
        width: size.width * 0.42,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2.0,
          child: Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.bottomRight,
              //   end: Alignment.topLeft,
              //   colors: [
              //     HexColor("#ff1c6b"),
              //     HexColor("#1e0070"),
              //   ],
              // ),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage('$image'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: Text(
                  exerciseText,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
