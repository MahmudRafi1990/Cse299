import 'package:flutter/material.dart';
import 'package:otsapp/utils/routes.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout and Feedback"),
    backgroundColor: Color.fromRGBO(0,0,0, 1),
      ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 10000,),
        Image.asset(
          "assets/images/Checkout_image.jpg",
          height: 200,
          width: 200,
        ),
        Text("Thank You for purchasing tickets from us",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )
        ),
        SizedBox(
          height : 16,
        ),
        Text("Please share your valuable feedback with us",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )
        ),
        SizedBox(
          height : 16,
        ),
        ElevatedButton(child: Text('Feedback'), onPressed: () {
          Navigator.pushNamed(context, MyRoutes.feedbackRoute);

        }
        ),
        SizedBox(
          height : 16,
        ),
        ElevatedButton(child: Text('Not now'), onPressed: () {
          Navigator.pushNamed(context, MyRoutes.loginRoute);
        },
        ),
        Text("For help call us on 017********",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )
        ),

      ]
    )

    );
  }
}
