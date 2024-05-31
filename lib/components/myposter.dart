import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPoster extends StatelessWidget {
  final String image;
  final String heading;
  final String description;

  const MyPoster({
    super.key,
    required this.image,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Ink(
          height: 160,
          width: 320,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        //

        const SizedBox(height: 10),
        Text(
          heading,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),

        //

        const SizedBox(height: 4),
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
