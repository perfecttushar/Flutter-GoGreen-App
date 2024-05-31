import 'package:flutter/material.dart';
import 'package:gogreen/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketPage extends StatelessWidget {
  final BookingDetails bookingDetails;
  const TicketPage({super.key, required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //
      // appbar
      //

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),

      //

      body: SafeArea(
        child: Column(
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
                      onPressed: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    ),
                  ),

                  //

                  const SizedBox(height: 30),
                  Text(
                    "Here's your ticket, you're  good to go!",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            //
            //
            //

            const SizedBox(height: 15),
            Container(
              width: double.maxFinite,
              height: 617,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Go Green',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white30,
                        ),
                      ),
                    ),

                    //

                    const SizedBox(height: 30),
                    Center(
                      child: QrImageView(
                        data:
                            'Name: ${bookingDetails.fullName}\nMobile No: ${bookingDetails.mobileNumber}\nSource: ${bookingDetails.source}\nDestination: ${bookingDetails.destination}\nDate: ${bookingDetails.date}\nFare: ${bookingDetails.fare}\nPassengers: ${bookingDetails.passengers}',
                        version: QrVersions.auto,
                        size: 180,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.circle,
                        ),
                        foregroundColor: Colors.white,
                      ),
                    ),

                    //

                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //

                          Text(
                            bookingDetails.source,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),

                          //

                          const Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            color: Colors.white,
                            size: 22,
                          ),

                          Text(
                            bookingDetails.destination,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    //
                    //

                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Divider(
                        color: Colors.white24,
                      ),
                    ),
                    const SizedBox(height: 5),

                    //
                    //
                    //

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //

                          Text(
                            bookingDetails.date,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),

                          //

                          Text(
                            ' ₹ ' + bookingDetails.fare.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),

                          //

                          Text(
                            bookingDetails.passengers.toString() + ' Passenger',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    //
                    //

                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Note: Please ensure that you have your QR Code ready to show when boarding the bus.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white30,
                        ),
                      ),
                    ),

                    //
                    //
                    //

                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //

                          InkWell(
                            onTap: () => Navigator.popUntil(
                                context, (route) => route.isFirst),
                            child: Container(
                              height: 60,
                              width: 362,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Navigate home',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //
            //
            //
          ],
        ),
      ),
    );
  }
}
