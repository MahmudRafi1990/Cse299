import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otsapp/firebase_options.dart';
import 'package:otsapp/paymentgateway.dart';
import 'package:otsapp/ticketbooking.dart';
import 'utils/routes.dart';
import 'feedback.dart';
import 'login.dart';
import 'signup.dart';
import 'checkout.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return MaterialApp(
        home: Login(),
        routes: {
          MyRoutes.loginRoute: (context) => Login(),
          MyRoutes.signupRoute: (context) => Signup(),
          MyRoutes.ticketbookingRoute: (context) => Ticketbooking(),
          MyRoutes.checkoutRoute: (context) => Checkout(),
          MyRoutes.feedbackRoute: (context) => FeedbackDialog(),
          MyRoutes.paymentgatewayRoute: (context) => Paymentgateway(),


        }
    );
  }




}