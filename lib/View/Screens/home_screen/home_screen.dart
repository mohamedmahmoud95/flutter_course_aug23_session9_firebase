import 'package:flutter/material.dart';
import 'package:flutter_course_aug23_session9_firebase/Firebase%20services/firebase_auth_services.dart';
import 'package:flutter_course_aug23_session9_firebase/View/Screens/landing_screen/landing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          firebaseAuthServices.logOut();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LandingScreen()));
        },
      ),
    );
  }
}
