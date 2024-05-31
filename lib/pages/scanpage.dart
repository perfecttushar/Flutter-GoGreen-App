import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  //
  // control qr
  //

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedCode = '';
  bool isChecking = false;
  bool dialogShown = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //
      // appbar
      //

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),

      //
      //
      //

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              // back button
              //

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
                "Scan the,\ngenerated QR code",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child:
                        QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
                  ),
                ),
              ),

              //

              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Place the QR code here",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                  ),
                ),
              ),

              //
              // details
              //

              const SizedBox(height: 20),
              Container(
                height: 280,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      //
                      //

                      Text(
                        'Passenger Details',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black),
                      ),

                      //
                      //
                      //

                      const SizedBox(height: 10),
                      isChecking
                          ? const Padding(
                              padding: EdgeInsets.all(50),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Text(
                              '$scannedCode',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),

                      //
                      //
                      //
                      const SizedBox(height: 10),
                      Spacer(),
                      const Divider(
                        color: Colors.black26,
                      ),

                      //
                      //
                      //

                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/logo/blazebus.png',
                            height: 35,
                            color: Colors.green,
                          ),

                          //

                          Text(
                            'GoGreen',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) async {
      if (!isChecking && !dialogShown) {
        setState(() {
          scannedCode = event.code!;
          isChecking = true;
        });
        await _checkQRCode(scannedCode);
      }
    });
  }

  Future<void> _checkQRCode(String code) async {
    final qrDoc = FirebaseFirestore.instance.collection('QR Codes').doc(code);
    final snapshot = await qrDoc.get();

    if (snapshot.exists && snapshot.data()?['scanned'] == true) {
      _showDialog('QR Code Expired', true);
    } else {
      if (!snapshot.exists) {
        await qrDoc.set({'scanned': true});
      } else {
        await qrDoc.update({'scanned': true});
      }
      _showDialog('Valid QR Code', false);
    }

    setState(() {
      isChecking = false;
    });
  }

  void _showDialog(String message, bool isExpired) {
    dialogShown = true;
    String imagePath =
        isExpired ? 'assets/icons/expired.png' : 'assets/icons/valid.png';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          icon: Image.asset(imagePath, height: 60),
          title: Text(message),
          titleTextStyle: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black87),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                minimumSize: MaterialStatePropertyAll(
                  Size(300, 50),
                ),
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                dialogShown = false;
              },
            ),
          ],
        );
      },
    );
  }
}
