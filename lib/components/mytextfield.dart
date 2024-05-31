import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextfield(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
      obscureText: obscureText,
      controller: controller,
      cursorColor: Colors.grey,
    );
  }
}

class MyTextfield2 extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const MyTextfield2({
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
              LengthLimitingTextInputFormatter(10),
            ]
          : null,
    );
  }
}
