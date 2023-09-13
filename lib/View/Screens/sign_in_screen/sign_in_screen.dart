import 'package:flutter/material.dart';

import '../../constants/project_colors.dart';
import '../sign_up_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool passwordIsHidden = true;
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
                onPressed: (){},
                child: const Text("Sign in", style: TextStyle(
                    fontSize: 20
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
                  }, child: Text("Register",
                    style: TextStyle(
                        fontSize: 18,
                        color: mainBlue

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
