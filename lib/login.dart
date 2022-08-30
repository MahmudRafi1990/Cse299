import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otsapp/feedback.dart';
import 'package:otsapp/utils/routes.dart';



class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();

}

class _loginState extends State<Login>{


  late String email;
  late String password;
  // moveToHome(BuildContext context) async {
  //   if (_formkey.currentState!.validate()) {
  //     setState(() {
  //       changeButton = true;
  //     });
  //     Navigator.pushNamed(context, MyRoutes.ticketbookingRoute);
  //     setState(() {
  //       changeButton = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Color.fromRGBO(0,0,0, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10000,),
          Image.asset(
            "assets/images/Loginpage_image.jpg",
            height: 300,
            width: 400,
          ),
          SizedBox(
            height: 30,
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
            ),
              onChanged: (value){
                // validator: (String? value) {
                // if (value!.isEmpty) {
                // return "Username cannot be empty";
                // }
                setState(() {
                  email=value;
                });
              },
            ),
          ),
          const SizedBox( height:16,),

          SizedBox(
            height: 30,
            width: 400,
            child: TextField(decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder()
            ),
              onChanged: (value) {
                // validator: (String? value) {
                // if (value!.isEmpty) {
                // return "Username cannot be empty";
                // }
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
          ),
          const SizedBox( height:16,),

          ElevatedButton(
            child: const Text("Sign in"),
            onPressed: () async{
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email, password: password);
                Navigator.pushNamed(context, MyRoutes.ticketbookingRoute);
              }
              catch(e){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email and Password empty or did not match"),));
              }

            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text("Sign Up"),
            onPressed: (){
              Navigator.pushNamed(context, '/signup');
            },

          ),
        ],
      ),
    );
  }
}