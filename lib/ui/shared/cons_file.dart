part of 'shareds.dart';

// -----------------
// Constant Color
// -----------------
Color primaryColor = Color(0xFFFFF5757);
Color accentColor = Color(0xFFF38B2AC);
Color whiteColor = Colors.white;
Color textColor = Color(0xFF747474);
Color bgColor = Color(0xFFEEEEEE);
Color backgroundColor = Color(0xFFF8F8F8);

// ----------------------
// Constant ThemeData
// ----------------------
ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: accentColor,
  textTheme: GoogleFonts.ralewayTextTheme(),
  scaffoldBackgroundColor: backgroundColor,
);

// -------------------
// Constant Shadow
// -------------------
List<BoxShadow> boxShadowBottom = [
  BoxShadow(
    color: Color(0xff747474).withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 8,
    offset: Offset(2, 4), // changes position of shadow
  ),
];

List<BoxShadow> boxShadowAbove = [
  BoxShadow(
    color: Color(0xff747474).withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 8,
    offset: Offset(-2, -4), // changes position of shadow
  ),
];

// -------------------
// Assets Location
// -------------------
String svgAsset = "assets/icon";
String imageAsset = "assets/images";

// ------------------
// Constant AppBar
// ------------------
PreferredSize get noAppBar => PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        brightness: Brightness.dark,
      ),
    );

// -------------------
// Constant API Url
// -------------------
final String apiKey = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEzODc4IiwiZW1haWwiOiJIRVJJMDEwNTAxQEdNQUlMLkNPTSIsImlhdCI6MTU5NjE2Nzk3NCwiZXhwIjozMTg3MjE3NjYwNDZ9.tVWjleDuzVzTri4FUqwDaEkxi0TfAD1ERRUJdUxAvis";
final String baseUrl = "https://access.krl.co.id";

final String stationNameList = "/c-access/access/nto/station";
final String scheduleStation = "/c-access/access/api/schedule";

// -----------------------
// Constant Shared Keys
// -----------------------
final String favStation = "STATION_LIST";