import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/components/mypayoptions.dart';
import 'package:gogreen/model/model.dart';
import 'package:gogreen/pages/dverificationpage.dart';
import 'package:google_fonts/google_fonts.dart';

class DPaymentsPage extends StatefulWidget {
  final DailyPass dailyPass;
  const DPaymentsPage({super.key, required this.dailyPass});

  @override
  State<DPaymentsPage> createState() => _DPaymentsPageState();
}

class _DPaymentsPageState extends State<DPaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),

      //

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              // back button and name
              //

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
                      'Choose your payment method',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              Image.asset('assets/images/payment.png'),

              //
              //
              //

              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    // options
                    //

                    const SizedBox(height: 50),
                    const MyPayOptions(
                      name: 'Debit / Credit card',
                      image: 'assets/icons/card.png',
                    ),

                    const SizedBox(height: 20),
                    const MyPayOptions(
                      name: 'Internet Banking',
                      image: 'assets/icons/bank.png',
                    ),

                    const SizedBox(height: 20),
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              DVerificationPage(dailyPass: widget.dailyPass),
                        ),
                      ),
                      child: const MyPayOptions2(
                        image: 'assets/images/gpay.png',
                        image2: 'assets/images/upi.png',
                      ),
                    ),

                    //
                    // note
                    //

                    const SizedBox(height: 25),
                    Text(
                      'Debit/credit cards and internet banking are unavailable. Please use UPI for payment.',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              //
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
