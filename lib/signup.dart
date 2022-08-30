

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otsapp/utils/routes.dart';



class Signup extends StatefulWidget{
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();

}

class _SignupState extends State<Signup>{

  final _auth=FirebaseAuth.instance;
   late String email;
   late String password;
   late String firstname;
   late String lastname;
   late int age;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        backgroundColor: Color.fromRGBO(0,0,0, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10000,),
          Image.asset(
            "assets/images/Signup_image.jpeg",
            height: 200,
            width: 400,
          ),
          SizedBox(
            height: 30,
            width: 400,
            child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder()
            ),

              onChanged: (value){
                setState(() {
                  firstname=value;
                });
              },
            ),
          ),
          const SizedBox( height:5,),

          SizedBox(
            height: 30,
            width: 400,
            child: TextField(
                controller: _controller1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder()
            ),
              onChanged: (value){
                setState(() {
                  lastname=value;
                });
              },
            ),
          ),
          const SizedBox( height:5,),

          SizedBox(
            height: 30,
            width: 400,
            child: TextField(
                controller: _controller2,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder()
            ),
              onChanged: (value){
                setState(() {
                  age=value as int;
                });
              },
            ),
          ),
          const SizedBox( height:5,),

          SizedBox(
            height: 30,
            width: 400,
            child: TextField(
                controller: _controller3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder()
            ),
              onChanged: (value){
                setState(() {
                  email=value;
                });
              },
            ),
          ),
          const SizedBox( height:5,),

          SizedBox(
            height: 30,
            width: 400,
            child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder()
            ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
          ),

          const SizedBox(height: 5),

          ElevatedButton(
            child: const Text("Sign Up"),
            onPressed: ()async{
              String message;
              try {

                final collection = FirebaseFirestore.instance.collection('Users');

                await collection.doc().set({
                  'timestamp': FieldValue.serverTimestamp(),
                  'First_Name': _controller.text,
                  'Last_Name': _controller1.text,
                  'Age': _controller2.text,
                  'Email;': _controller3.text,
                  'Password': _controller4.text,
                });

                message = 'User created successfully';
              } catch (e) {
                message = 'User creation not done';
              }
              try{
                final newuser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if(newuser != null){
                  Navigator.pushNamed(context, MyRoutes.ticketbookingRoute);
                }
              }
              catch(e){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User already exists"),));
              }
            },
          ),
        ],
      ),
    );
  }

}