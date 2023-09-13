import 'package:flutter/material.dart';
import 'package:flutter_course_aug23_session9_firebase/View/Screens/sign_in_screen/sign_in_screen.dart';
import 'package:flutter_course_aug23_session9_firebase/View/Screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_course_aug23_session9_firebase/View/constants/project_colors.dart';

import '../../constants/font_styles.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool passwordIsHidden = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mint,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:

              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInScreen()));
                },
                  child: Image.asset("assets/images/logo4.png")),
        ),
      ),
    );
  }
}
