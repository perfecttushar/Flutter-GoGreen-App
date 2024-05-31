import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/components/myaadhar.dart';
import 'package:gogreen/components/mytextfield.dart';
import 'package:gogreen/model/model.dart';
import 'package:gogreen/pages/dpaymentspage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Dailpasspage extends StatefulWidget {
  const Dailpasspage({super.key});

  @override
  State<Dailpasspage> createState() => _DailpasspageState();
}

class _DailpasspageState extends State<Dailpasspage> {
  //
  // textfield controller
  //

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mobcontroller = TextEditingController();
  final TextEditingController aadharcontroller = TextEditingController();

  //
  // gender
  //

  String selectedgender = '';

  Widget customRadio(String text, String gender) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        side: const MaterialStatePropertyAll(BorderSide.none),
        backgroundColor: MaterialStatePropertyAll(
          (selectedgender == gender)
              ? const Color(0xff286EF0)
              : Colors.grey.shade100,
        ),
        minimumSize: const MaterialStatePropertyAll(
          Size(135, 60),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedgender = gender;
        });
      },
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: (selectedgender == gender) ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  //
  // current date
  //

  late final String formatter;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    formatter = DateFormat('yMd').format(now);
  }

  //
  // check vlaues and go to payment page
  //

  void gotopayment() async {
    if (namecontroller.text.isEmpty || mobcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill up all the details',
            style: GoogleFonts.poppins(),
            textAlign: TextAlign.center,
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      DailyPass dailyPass = DailyPass(
          fullName: namecontroller.text,
          mobileNumber: mobcontroller.text,
          aadhar: aadharcontroller.text,
          gender: selectedgender,
          date: formatter,
          fare: '₹ 50');

      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => DPaymentsPage(dailyPass: dailyPass),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              // back button & text
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
                      "Let's get\nyour daily pass",
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

              const SizedBox(height: 10),
              Image.asset('assets/images/dailypass.png'),

              //
              //
              //

              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    // name & phone
                    //

                    const SizedBox(height: 20),
                    Text(
                      'Your details',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //

                    const SizedBox(height: 15),
                    MyTextfield2(
                      hintText: 'Name',
                      keyboardType: TextInputType.text,
                      controller: namecontroller,
                    ),

                    //

                    const SizedBox(height: 15),
                    MyTextfield2(
                      hintText: 'Mobile Number',
                      keyboardType: TextInputType.number,
                      controller: mobcontroller,
                    ),

                    //

                    const SizedBox(height: 15),
                    MyAadhar(
                      hintText: 'Aadhar No.',
                      keyboardType: TextInputType.number,
                      controller: aadharcontroller,
                    ),

                    //
                    // Gender
                    //

                    const SizedBox(height: 40),
                    Text(
                      'Gender',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 20,
                          ),
                        ),

                        //

                        customRadio('Male', 'Male'),
                        customRadio('Female', 'Female'),
                      ],
                    ),

                    //
                    // date & fare
                    //

                    const SizedBox(height: 40),
                    Text(
                      'Date & Fare',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.calendar_today_rounded,
                            size: 20,
                          ),
                        ),

                        //

                        Container(
                          height: 60,
                          width: 135,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              formatter,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),

                        //

                        Container(
                          height: 60,
                          width: 135,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              '₹ 50',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //
                    // button
                    //

                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: const MaterialStatePropertyAll(
                          Size(double.maxFinite, 60),
                        ),
                        shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.grey.shade800,
                        ),
                      ),
                      onPressed: () => gotopayment(),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    //
                    // text
                    //

                    const SizedBox(height: 25),
                    Text(
                      'Note: Please ensure that accurate data is entered into the appropriate fields.',
                      style:
                          GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
