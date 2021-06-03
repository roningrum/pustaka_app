import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF019934);
const kSurfaceColor = Color(0xFFFFFFFF);
const kFontColor = Color(0xFF00170C);

//URL
const String PUSTAKA_URL = 'http://119.2.50.170:9095/pustaka/home';
const String Whatsapp_URL = 'https://wa.me';

const kPustakaBlackBoldMedium = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  color: kFontColor
);

const kPustakaBlackRegular= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: kFontColor
);

const kPustakaGreenRegular= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: kPrimaryColor
);

const kPustakaGreenMedium= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: kPrimaryColor
);

const kPustakaWhiteMedium= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: kSurfaceColor
);
const kPustakaWhiteNormal= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: kSurfaceColor
);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

fivePercentWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.05;
}


