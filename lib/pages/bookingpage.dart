import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogreen/components/mytextfield.dart';
import 'package:gogreen/model/model.dart';
import 'package:gogreen/pages/paymentspage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  //
  // textfield controller
  //

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mobcontroller = TextEditingController();

  //
  // Dropdown lists default values
  //

  String selectedsource = '';
  List<String> source = [
    'Pimpri',
    'Kharadi',
    'Akurdi',
    'Shivaji Nagar',
    'Viman Nagar',
  ];

  String selecteddestination = '';
  List<String> destination = [
    'Pimpri',
    'Kharadi',
    'Akurdi',
    'Shivaji Nagar',
    'Viman Nagar',
  ];

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
  // dsiplay fare
  //

  // Sample fare data (source, destination) -> fare
  Map<String, Map<String, int>> fareChart = {
    'Pimpri': {
      'Kharadi': 50,
      'Akurdi': 20,
      'Shivaji Nagar': 30,
      'Viman Nagar': 40
    },
    'Kharadi': {
      'Pimpri': 50,
      'Akurdi': 60,
      'Shivaji Nagar': 40,
      'Viman Nagar': 20
    },
    'Akurdi': {
      'Pimpri': 20,
      'Kharadi': 60,
      'Shivaji Nagar': 50,
      'Viman Nagar': 70
    },
    'Shivaji Nagar': {
      'Pimpri': 30,
      'Kharadi': 40,
      'Akurdi': 50,
      'Viman Nagar': 60
    },
    'Viman Nagar': {
      'Pimpri': 40,
      'Kharadi': 20,
      'Akurdi': 70,
      'Shivaji Nagar': 60
    },
  };

  int fare = 0;

  void calculateFare() {
    if (selectedsource.isNotEmpty && selecteddestination.isNotEmpty) {
      setState(() {
        int baseFare = fareChart[selectedsource]?[selecteddestination] ?? 0;
        fare = baseFare * passengers;
      });
    }
  }

  //
  // Passengers
  //

  int passengers = 1;

  void _increment() {
    setState(() {
      if (passengers < 5) {
        passengers++;
        calculateFare();
      }
    });
  }

  void _decrement() {
    setState(() {
      if (passengers > 1) {
        passengers--;
        calculateFare();
      }
    });
  }

  //
  // check vlaues and go to payment page
  //

  void gotopayment() async {
    if (namecontroller.text.isEmpty ||
        mobcontroller.text.isEmpty ||
        source.isEmpty ||
        selecteddestination.isEmpty) {
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
      BookingDetails bookingDetails = BookingDetails(
        fullName: namecontroller.text,
        mobileNumber: mobcontroller.text,
        source: selectedsource,
        destination: selecteddestination,
        date: formatter,
        fare: fare,
        passengers: passengers,
      );

      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => PaymentsPage(bookingDetails: bookingDetails),
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
                      "Let's get\nyour ticket booked",
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
              Image.asset('assets/images/book.png'),

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
                      'Name & Mob.',
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
                    // source and destination
                    //

                    const SizedBox(height: 50),
                    Text(
                      'Where to go ?',
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
                            color: const Color(0xff328859),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.directions_bus_outlined,
                            color: Colors.white,
                          ),
                        ),

                        //

                        Container(
                          height: 60,
                          width: 290,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CustomDropdown<String>(
                              decoration: CustomDropdownDecoration(
                                headerStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                                closedBorderRadius: BorderRadius.circular(3),
                                expandedBorderRadius: BorderRadius.circular(3),
                                listItemStyle:
                                    GoogleFonts.poppins(fontSize: 14),
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              hintText: 'Select source place',
                              items: source,
                              onChanged: (value) {
                                setState(() {
                                  selectedsource = value;
                                  destination = [
                                    'Pimpri',
                                    'Kharadi',
                                    'Akurdi',
                                    'Shivaji Nagar',
                                    'Viman Nagar'
                                  ].where((e) => e != value).toList();
                                });
                                calculateFare();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    //

                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xff1B51BD),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.directions_bus_outlined,
                            color: Colors.white,
                          ),
                        ),

                        //

                        Container(
                          height: 60,
                          width: 290,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CustomDropdown<String>(
                              decoration: CustomDropdownDecoration(
                                headerStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                                closedBorderRadius: BorderRadius.circular(3),
                                expandedBorderRadius: BorderRadius.circular(3),
                                listItemStyle:
                                    GoogleFonts.poppins(fontSize: 14),
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              hintText: 'Select destination place',
                              items: destination,
                              onChanged: (value) {
                                setState(() {
                                  selecteddestination = value;
                                });
                                calculateFare();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    //
                    // date and time
                    //

                    const SizedBox(height: 50),
                    Text(
                      'When to go ?',
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
                            Icons.calendar_today_rounded,
                            size: 20,
                          ),
                        ),

                        //

                        Container(
                          height: 60,
                          width: 138,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              formatter,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        //

                        Container(
                          height: 60,
                          width: 138,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'Fare: \₹ ${fare.toStringAsFixed(0)}',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //
                    // passengers
                    //

                    const SizedBox(height: 50),
                    Text(
                      'Passengers ?',
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
                            Icons.people_alt_outlined,
                            size: 20,
                          ),
                        ),

                        //

                        Container(
                          height: 60,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'Seats : $passengers',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        //

                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                          ),
                          child: IconButton(
                            onPressed: () => _increment(),
                            icon: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),

                        //

                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.shade100),
                          child: IconButton(
                            onPressed: () => _decrement(),
                            icon: const Icon(
                              Icons.remove,
                              size: 20,
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
