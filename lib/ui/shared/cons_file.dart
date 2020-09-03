part of 'shareds.dart';

// -----------------
// Constant Color
// -----------------
Color primaryColor = Color(0xFFFFF5757);
Color accentColor = Color(0xFFF38B2AC);
Color whiteColor = Colors.white;
Color darkTextColor = Color(0xFF747474);
Color inputBackgroundColor = Color(0xFFEEEEEE);
Color scaffoldBackgroundColor = Color(0xFFF8F8F8);
Color yellowColor = Color(0XFFF9C12D); 

// ----------------------
// Constant ThemeData
// ----------------------
ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: accentColor,
  textTheme: GoogleFonts.poppinsTextTheme(),
  scaffoldBackgroundColor: scaffoldBackgroundColor,
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

