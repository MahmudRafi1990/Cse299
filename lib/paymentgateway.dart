import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otsapp/utils/routes.dart';

class Paymentgateway extends StatefulWidget {
  const Paymentgateway({Key? key}) : super(key: key);

  @override
  State<Paymentgateway> createState() => _PaymentgatewayState();
}

class _PaymentgatewayState extends State<Paymentgateway> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Payment Gateway"),
    backgroundColor: Color.fromRGBO(0,0,0, 1),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 10000,),
        Image.asset(
          "assets/images/Payment_image.jpeg",
          height: 300,
          width: 400,
        ),
        SizedBox( height:16,),
        SizedBox(
          height: 30,
          width: 400,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(),
              ),
            ),
        ),
        SizedBox( height:16,),
        SizedBox(
          height: 30,
          width: 400,
          child: TextField(
            controller: _controller1,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Amount",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox( height:16,),
        SizedBox(
          height: 30,
          width: 400,
          child: TextField(
            controller: _controller2,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Pin",
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
        ),
            ElevatedButton(child: Text('Pay'),
              onPressed: () async {
                  String message;
                  try {

                    final collection = FirebaseFirestore.instance.collection('Payments');

                    await collection.doc().set({
                      'timestamp': FieldValue.serverTimestamp(),
                      'Phone_Number': _controller.text,
                      'Amount': _controller1.text,
                      'Pin': _controller2.text,
                    });

                    message = 'Payment done successfully';
                  } catch (e) {
                    message = 'Payment not done';
                  }

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, MyRoutes.checkoutRoute);
                }
            ),
      ],
    ),
    );
  }
}
