import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            answer,
            style:
                GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
}
