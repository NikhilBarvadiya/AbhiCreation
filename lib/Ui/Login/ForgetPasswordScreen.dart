import 'package:abhicreativefashion/Common/Widget/Custom.dart';import 'package:abhicreativefashion/Common/Widget/validator.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:flutter/material.dart';class ForgotPasswordScreen extends StatefulWidget {  @override  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();}class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {  TextEditingController _emailTextController = TextEditingController();  FirebaseAuth firebaseAuth = FirebaseAuth.instance;  final _formKey = GlobalKey<FormState>();  @override  Widget build(BuildContext context) {    return Scaffold(      body: Form(        key: _formKey,        child: Padding(          padding: const EdgeInsets.symmetric(horizontal: 30.0),          child: Column(            mainAxisAlignment: MainAxisAlignment.center,            children: [              CustomTextField(                icon: Icons.person,                color: Colors.grey,                height: 50,                width: 300,                Name: "Email",                keyboardType: TextInputType.emailAddress,                controller: _emailTextController,                validator: (value) => Validator.validateEmail(                  email: value,                ),              ),              SizedBox(height: 20),              CustomBotton(                height: 50,                width: 200,                text: "Reset Password",                function: ()  {                  resetPassword();                },              ),            ],          ),        ),      ),    );  }  Future resetPassword() async {    try{      await FirebaseAuth.instance          .sendPasswordResetEmail(email: _emailTextController.text.trim());      Navigator.pushNamed(context, '/LoginScreenRoute');      print('Password Reset Email Set');    }on FirebaseAuthException catch(e){      print(e);      Navigator.pop(context);    }  }}