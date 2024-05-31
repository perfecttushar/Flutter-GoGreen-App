class BookingDetails {
  final String fullName;
  final String mobileNumber;
  final String source;
  final String destination;
  final String date;
  final int fare;
  final int passengers;

  BookingDetails({
    required this.fullName,
    required this.mobileNumber,
    required this.source,
    required this.destination,
    required this.date,
    required this.fare,
    required this.passengers,
  });
}

class DailyPass {
  final String fullName;
  final String mobileNumber;
  final String aadhar;
  final String gender;
  final String date;
  final String fare;

  DailyPass({
    required this.fullName,
    required this.mobileNumber,
    required this.date,
    required this.aadhar,
    required this.gender,
    required this.fare,
  });
}
