// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/auth/auth_service.dart';
import 'package:my_chat_app/models/user_model.dart';
import 'package:my_chat_app/pages/launcher_page.dart';
import 'package:my_chat_app/pages/login_page.dart';
import 'package:my_chat_app/pages/user_list_page.dart';
import 'package:my_chat_app/providers/user_provider.dart';
import 'package:provider/provider.dart'; 

class SignUpPage extends StatefulWidget {
  static const routeName = "sign-up-page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String _errorMessage="";

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                
             
                SizedBox(height: 40,),
                 
                const Text(
                  "SignUP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      fontStyle: FontStyle.normal),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/person.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 20,
                ),

                // todo This is name textField section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe6e6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                        ),
                        hintText: "Enter your full name",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                      if (value.length > 20) {
                        return 'name must be in 20 character';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                // todo This is email textField section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe6e6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                       else {
                        return null;
                      }
                    },
                  ),
                ),

                // todo this is password textField section
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: TextFormField(
                    obscureText: _isObscure,
                    controller: passwordController,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe6e6e6),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field must not be empty';
                      }
                    else {
                        return null;
                      }
                    },
                  ),
                ),
                Text(_errorMessage, style: TextStyle(color: Colors.red),),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: ElevatedButton(
                      onPressed: _saveUserInfo,
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      child: Text(
                        "Sign UP",
                        style: TextStyle(fontSize: 16),
                      )),
                ),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'You have account? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text: ' Log In',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, LoginPage.routeName);
                          }),
                  ]),
                ),
              ],
            )),
      ),
    );
  }

  void _saveUserInfo() async {
    if(formKey.currentState!.validate()){

      try{
          await AuthService.signUp(emailController.text, passwordController.text);
        await AuthService.sendVeryficationMail();
        final userModel = UserModel(
          uid: AuthService.user!.uid,
          name: nameController.text,
          email: AuthService.user!.email

        );
        if(mounted){
         await Provider.of<UserProvider>(context,listen: false).addUser(userModel);
        }
       if(mounted){
         Navigator.pushReplacementNamed(context, LauncherPage.routeName);
       }
        
      }on FirebaseAuthException catch(e){
        setState(() {
          _errorMessage = e.message!;
        });
      }



    }
  }
}