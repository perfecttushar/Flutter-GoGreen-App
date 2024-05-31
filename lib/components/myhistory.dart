import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Myhistory extends StatelessWidget {
  const Myhistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Center(child: Text('No user is currently signed in.'));
    }

    final Stream<QuerySnapshot<Map<String, dynamic>>> _itemsCollection =
        FirebaseFirestore.instance
            .collection('Tickets')
            .doc(user.email)
            .collection('Bookings')
            .snapshots();

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _itemsCollection,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final data = snapshot.requireData;

        return Column(
          children: data.docs.map((doc) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 265,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/logo/blazebus.png',
                            height: 40,
                            color: Colors.white30,
                          ),

                          //

                          Text(
                            'GoGreen',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white30),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 18,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 10),
                          Text(
                            doc['fullName'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),

                      //

                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 18,
                                color: Colors.white70,
                              ),
                              SizedBox(width: 10),
                              Text(
                                doc['mobileNumber'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),

                          //

                          Row(
                            children: [
                              Icon(
                                Icons.people,
                                size: 16,
                                color: Colors.white70,
                              ),
                              SizedBox(width: 10),
                              Text(
                                doc['passengers'].toString() + ' ticket',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //
                      //
                      //

                      SizedBox(height: 10),
                      Divider(
                        color: Colors.white12,
                      ),
                      SizedBox(height: 10),

                      //
                      //
                      //

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.directions_bus,
                                size: 16,
                                color: Color(0xff328859),
                              ),
                              SizedBox(width: 10),
                              Text(
                                doc['origin'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),

                          //

                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white70,
                            size: 16,
                          ),

                          //

                          Row(
                            children: [
                              Icon(
                                Icons.directions_bus,
                                size: 16,
                                color: Color(0xff1B51BD),
                              ),
                              SizedBox(width: 10),
                              Text(
                                doc['destination'],
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //
                      //
                      //

                      SizedBox(height: 10),
                      Divider(
                        color: Colors.white12,
                      ),
                      SizedBox(height: 10),

                      //
                      //
                      //

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                size: 16,
                                color: Colors.white70,
                              ),
                              SizedBox(width: 10),
                              Text(
                                doc['date'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),

                          //

                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee_sharp,
                                size: 16,
                                color: Colors.white70,
                              ),
                              SizedBox(width: 5),
                              Text(
                                doc['fare'].toString(),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
