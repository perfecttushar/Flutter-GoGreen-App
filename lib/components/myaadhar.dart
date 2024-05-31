import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAadhar extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const MyAadhar({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      controller: controller,
      cursorColor: Colors.black,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      inputFormatters: keyboardType == TextInputType.number
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(12),
            ]
          : null,
    );
  }
}
