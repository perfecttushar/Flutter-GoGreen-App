import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gogreen/components/myotptextfield.dart';
import 'package:gogreen/model/model.dart';
import 'package:gogreen/pages/dticketpage.dart';

class DVerificationPage extends StatefulWidget {
  final DailyPass dailyPass;
  const DVerificationPage({Key? key, required this.dailyPass})
      : super(key: key);

  @override
  State<DVerificationPage> createState() => _DVerificationPageState();
}

class _DVerificationPageState extends State<DVerificationPage> {
  User? user = FirebaseAuth.instance.currentUser;
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  EmailOTP myauth = EmailOTP();

  void SendOtp() async {
    myauth.setTheme(theme: "v2");
    myauth.setConfig(
      appEmail: "gogreencare@gmail.com",
      appName: "GoGreen",
      userEmail: user?.email,
      otpLength: 4,
      otpType: OTPType.digitsOnly,
    );
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "OTP Sent !",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Unable to send Otp",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void VerifyOtp() async {
    String fullOtp = otp1.text + otp2.text + otp3.text + otp4.text;
    if (await myauth.verifyOTP(otp: fullOtp) == true) {
      showCircularProgress();
      await Future.delayed(Duration(seconds: 3));
      saveBookingDetailsToFirebase(widget.dailyPass);
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => DTicketPage(dailyPass: widget.dailyPass),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Invalid OTP",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> saveBookingDetailsToFirebase(DailyPass dailyPass) async {
    try {
      await FirebaseFirestore.instance
          .collection('Daily Pass')
          .doc(user?.email)
          .collection('Tickets')
          .add({
        'fullName': dailyPass.fullName,
        'mobileNumber': dailyPass.mobileNumber,
        'aadhar': dailyPass.aadhar,
        'gender': dailyPass.gender,
        'date': dailyPass.date,
        'fare': dailyPass.fare,
      });
    } catch (e) {}
  }

  void showCircularProgress() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            height: 80,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.green,
                ),
                SizedBox(height: 15),
                Text(
                  "Booking in progress",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 16),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        const SizedBox(height: 30),
                        Text(
                          'Enter your OTP for the payment',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Image.asset('assets/images/otp.png'),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyOtpTextfield(
                              controller: otp1,
                            ),
                            MyOtpTextfield(
                              controller: otp2,
                            ),
                            MyOtpTextfield(
                              controller: otp3,
                            ),
                            MyOtpTextfield(
                              controller: otp4,
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Text(
                          'Click on send otp or resend otp, We will send 4 digit verification code on your email you can check your inbox, please ensure to enter valid OTP.',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 35),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey.shade800),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                              Size(double.maxFinite, 60),
                            ),
                          ),
                          onPressed: () => VerifyOtp(),
                          child: Text(
                            'Continue',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              "Click here to ",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                              onTap: () => SendOtp(),
                              child: Text(
                                ' Send OTP / Resend OTP',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
