import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPayOptions extends StatelessWidget {
  final String name;
  final String image;

  const MyPayOptions({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Image.asset(
              image,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class MyPayOptions2 extends StatelessWidget {
  final String image;
  final String image2;

  const MyPayOptions2({
    super.key,
    required this.image2,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 60,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 20,
              color: Colors.white,
            ),
            Image.asset(
              image2,
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}
