import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyefit_Iris/constants/constants.dart';
import 'package:eyefit_Iris/screens/eye_mission.dart';
import 'package:eyefit_Iris/screens/home_screen.dart';
import 'package:eyefit_Iris/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../screens/auth/login_screen.dart';
import '../screens/eye_test.dart';
import '../screens/meditation_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: HexColor("#27048f"),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                HexColor("#3a00e6"),
                HexColor("#200080"),
              ]),
            ),
            padding: const EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  HexColor("#3a00e6"),
                  HexColor("#200080"),
                ]),
              ),
              accountName: Text('Armaan'),
              accountEmail: Text('armaan33000@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1474533410427-a23da4fd49d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGV5ZXMlMjByaWdodCUyMGFuZCUyMGxlZnR8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              moveScreen(context, true, HomeScreen());
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.6,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              moveScreen(context, false, EyeMissionScreen());
            },
            child: ListTile(
              leading: Icon(
                Icons.center_focus_strong_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Eyes Misson',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.6,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              moveScreen(context, false, MeditationScreen());
            },
            child: ListTile(
              leading: Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.white,
              ),
              title: Text(
                'Meditation time',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.6,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              moveScreen(context, false, EyeTestScreen());
            },
            child: ListTile(
              leading: Icon(
                Icons.newspaper,
                color: Colors.white,
              ),
              title: Text(
                'Eye Test',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Divider(
            height: 0.5,
            thickness: 0.6,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              moveScreen(context, false, ProfileScreen());
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'My Profile',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.6,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
              moveScreen(context, true, LoginScreen());
            },
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.6,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
