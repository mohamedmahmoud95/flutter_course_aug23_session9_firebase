import 'package:flutter/material.dart';
import 'package:flutter_course_aug23_session9_firebase/Firebase%20services/firebase_auth_services.dart';

import '../../constants/project_colors.dart';
import '../home_screen/home_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool passwordIsHidden = true;

  bool validateEmail()
  {
    bool emailIsValid = false;
    if (emailTextEditingController.text.isEmpty)
      {
        debugPrint("email field is empty");
      }
    else if (!(emailTextEditingController.text.contains('.') && emailTextEditingController.text.contains('@')) || emailTextEditingController.text.length < 7){
      debugPrint("Invalid email");
    }
    else
      {
        emailIsValid = true;
      }
    return emailIsValid;

  }

  bool validatePassword()
  {
    bool passwordIsValid = false;
    if (passwordTextEditingController.text.isEmpty)
    {
      debugPrint("password field is empty");
    }
    else if (passwordTextEditingController.text.length < 6){
      debugPrint("password must be at least 6 characters");
    }
    else
    {
      passwordIsValid = true;
    }
    return passwordIsValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 100,),

              Image.asset("assets/images/logo4.png"),




              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailTextEditingController,

                  decoration: InputDecoration(

                    labelText: "Email",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: bluishGrey, width: 1),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mainBlue, width: 1),

                    ),
                  ),

                ),
              ),

              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordTextEditingController,
                  obscureText: passwordIsHidden,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          passwordIsHidden = !passwordIsHidden;
                        });
                      },
                      child:  Icon(
                        passwordIsHidden ? Icons.visibility : Icons.visibility_off, // Use appropriate icons for visibility
                      ),
                    ),

                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: bluishGrey, width: 1),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mainBlue, width: 1),

                    ),
                  ),

                ),
              ),

              const SizedBox(height: 20,),


              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: bluishGreen,
                  minimumSize: const Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: ()async{
                  if (validateEmail() == true && validatePassword() == true)
                    {
                      debugPrint("trying to sign in");
                        bool signInResult = await firebaseAuthServices.signIn(
                            emailTextEditingController.text,
                            passwordTextEditingController.text);

                        if (signInResult == true) {
                          debugPrint("signed in");

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }
                      };

                },
                child: const Text("Sign in", style: TextStyle(
                    fontSize: 20
                ),),
              ),

              const SizedBox(height: 20,),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: mainBlue, width: 1),
                  ),
                  minimumSize: const Size(200, 40),
                  foregroundColor: bluishGreen,
                ),
                  onPressed: ()async{
                      bool signInResult = await firebaseAuthServices.signInAnonymously();

                      if (signInResult == true) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }

                  },
                  child: const Text("Sign in anonymously",
                  style: TextStyle(
                    fontSize: 18
                  ),),
              ),


              const SizedBox(height: 20,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(
                    fontSize: 18,

                  ),),

                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                  }, child: Text("Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        color: mainBlue,
                      fontWeight: FontWeight.w600

                    ),),),
                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}
