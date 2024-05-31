import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutuspage extends StatefulWidget {
  const Aboutuspage({super.key});

  @override
  State<Aboutuspage> createState() => _AboutuspageState();
}

class _AboutuspageState extends State<Aboutuspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),

      //

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              // back button and name
              //

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.keyboard_arrow_left_rounded),
                          ),
                        ),

                        //

                        const SizedBox(height: 30),
                        Text(
                          "About Us",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  Image.asset('assets/images/ebus.png'),

                  //
                  // info
                  //

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Welcome aboard the PMPML Bus Service, your link to Pune and its vibrant surroundings! Discover Pune, the 'Queen of Deccan', steeped in history, from the birthplace of saint Tukaram to the realm of Chhatrapati Shivaji Maharaj. Dive into a legacy of social reformers and freedom fighters. Explore prestigious educational hubs, research centers, and thriving industries. Let's journey together through Pune's rich tapestry of culture and innovation!",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 30),
                        // Mission
                        Text(
                          'Our Mission',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                            'Our mission at PMPML is to introduce an easy, sustainable, and environmentally friendly e-ticket system for our bus service. We aim to provide a seamless travel experience while reducing paper waste and promoting eco-friendly practices.',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.justify),
                        SizedBox(height: 30),
                        // Vision
                        Text(
                          'Our Vision',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                            'We envision PMPML as a leader in sustainable urban mobility solutions, driven by technology and innovation. Our goal is to create a cleaner, greener future by offering reliable, efficient, and eco-friendly public transport options for the residents of Pune and its surrounding regions.',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.justify),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
