part of 'shareds.dart';

// -----------------
// Constant Color
// -----------------
Color primaryColor = Color(0xFFFFF5757);
Color accentColor = Color(0xFFF38B2AC);
Color whiteColor = Colors.white;

// ----------------------
// Constant ThemeData
// ----------------------
ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: accentColor,
  textTheme: GoogleFonts.ralewayTextTheme(),
);

// -------------------
// Constant Shadow
// -------------------
List<BoxShadow> boxShadowBottom = [
  BoxShadow(
    color: Color(0xff747474).withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 8,
    offset: Offset(0, 4), // changes position of shadow
  ),
];

List<BoxShadow> boxShadowAbove = [
  BoxShadow(
    color: Color(0xff747474).withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 8,
    offset: Offset(0, -4), // changes position of shadow
  ),
];

// -------------------
// Assets Location
// -------------------
String svgAsset = "assets/svg";
String imageAsset = "assets/images";
