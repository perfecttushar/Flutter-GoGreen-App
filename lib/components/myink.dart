import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInk extends StatelessWidget {
  final String name;
  final String image;

  const MyInk({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //

        Ink(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Image.asset(
              image,
              height: 26,
            ),
          ),
        ),

        //

        const SizedBox(height: 10),
        Text(
          name,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
