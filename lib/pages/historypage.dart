import 'package:flutter/material.dart';
import 'package:gogreen/components/myhistory.dart';
import 'package:google_fonts/google_fonts.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
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
                          "Your recently booked\ntickets",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                  // history
                  //

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Myhistory(),
                  ),
                  SizedBox(height: 10),

                  //
                  //
                  //
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
