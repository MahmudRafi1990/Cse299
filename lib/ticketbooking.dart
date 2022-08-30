import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:otsapp/utils/routes.dart';

class Ticketbooking extends StatefulWidget {
  const Ticketbooking({Key? key}) : super(key: key);

  @override
  _TicketbookingState createState() => _TicketbookingState();
}

class _TicketbookingState extends State<Ticketbooking> {

  final CollectionReference _Trains =
  FirebaseFirestore.instance.collection('Trains');


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Ticket Booking Page"),
          backgroundColor: Color.fromRGBO(0,0,0, 1),
        ),

        body: StreamBuilder(
            stream: _Trains.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context , index) {
                    final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(

                        leading: Text(documentSnapshot['Train']),
                        title: Text("Route :"+documentSnapshot['Route']),
                        subtitle: Column(
                          children: <Widget>[
                            Text("Departure Time :"+documentSnapshot['Departure_Time']),
                            ElevatedButton(child: Text('Buy'), onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.paymentgatewayRoute);

                              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("added to cart"),));
                              //cartController.addProduct(streamSnapshot.data!.docs[index]);
                            }
                            )
                          ],
                        ),
                        trailing: Text("\$${documentSnapshot['Price']}"),
                      ),
                    );
                  },
                );


              }
              return const Center(
                child: CircularProgressIndicator(),
              );



            }
        )
    );
  }



}
