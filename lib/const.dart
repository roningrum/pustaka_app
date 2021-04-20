import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF019934);
const kSurfaceColor = Color(0xFFFFFFFF);
const kFontColor = Color(0xFF00170C);

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
fivePercentWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.05;
}


