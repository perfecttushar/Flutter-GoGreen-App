import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Helppage extends StatelessWidget {
  const Helppage({Key? key}) : super(key: key);

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
                          "Help Hub: Your Assistance Avenue",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  Image.asset('assets/images/help.png'),

                  //
                  // info
                  //

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Need help? Reach out to us for prompt assistance tailored to your needs. Our dedicated team is here to support you every step of the way.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.justify,
                        ),

                        //

                        SizedBox(height: 30),
                        Text(
                          "Customer Service: 020 2454 5454",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        //

                        SizedBox(height: 30),
                        Text(
                          "Note: Phone support available now, stay tuned for email and additional services.",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            height: 1.6,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.justify,
                        ),
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
