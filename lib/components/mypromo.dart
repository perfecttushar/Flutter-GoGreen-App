import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPromo extends StatelessWidget {
  final Color color;
  final String image;
  final String heading;
  final String description;

  const MyPromo({
    super.key,
    required this.image,
    required this.color,
    required this.heading,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 363,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                //

                Row(
                  children: [
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),

          //

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }
}
