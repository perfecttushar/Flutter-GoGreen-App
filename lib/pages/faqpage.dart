import 'package:flutter/material.dart';
import 'package:gogreen/components/myfaq.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),

      //

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              // back button and name
              //

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

                        //

                        const SizedBox(height: 30),
                        Text(
                          "Frequently Asked\nQuestions",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  Image.asset('assets/images/faq.png'),

                  //
                  // Questions
                  //

                  SizedBox(height: 15),
                  FAQItem(
                    question: 'How do I pay for my bus fare?',
                    answer:
                        'You can book your ticket and pay fare in our gogreen app either from your wallet or UPI id.',
                  ),

                  SizedBox(height: 5),
                  FAQItem(
                    question:
                        'Are there discounts available for regular commuters?',
                    answer:
                        'Yes, we offer discounted fares for regular commuters who use our e-ticket system.',
                  ),

                  SizedBox(height: 5),
                  FAQItem(
                    question: 'Can I bring luggage onboard?',
                    answer:
                        'Small luggage items like backpacks and handbags are allowed onboard. However, larger items may need to be stowed in the designated luggage compartments.',
                  ),

                  SizedBox(height: 5),
                  FAQItem(
                    question: 'How can I find my bus route and schedule?',
                    answer:
                        'You can check bus routes and schedules on the PMPML website.',
                  ),

                  SizedBox(height: 5),
                  FAQItem(
                    question:
                        'What should I do if I lose my belongings on the bus?',
                    answer:
                        'Please contact our customer service helpline immediately to report lost items. We will do our best to assist you in locating your belongings.',
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
