import 'package:flutter/material.dart';

//All the color constants
Color kPrimaryColor = Colors.red;
Color kAccentColor = Color(0xfffef9eb);
Color kCardColor = Colors.white;
Color kTextColor1 = Colors.blueGrey;
Color kTextColor2 = Colors.grey;
Color kMessageText = Colors.black;
Color kGradientRed = Color(0xffffefee);

//All colors in dark mode
Color kPrimaryColordark = Color(0xff121212);
Color kAccentColordark = Color(0xff2222222);
Color kCardColordark = Color(0xff222222);
Color kTextColor1dark = Colors.white54;
Color kTextColor2dark = Colors.white38;
Color kMessageTextdark = Colors.white70;
Color kGradientRedDark = Color(0xff444444);

//Sizes and radii
double kAppBarIconSize = 30.0;
double kCircleAvatarRadii = 35.0;

//Text Styles
TextStyle kAppBarTextStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
);
TextStyle kDrawerName = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.w500,
  color: Colors.white
);
TextStyle kDrawerOptions = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
  color: Colors.white60
);

TextStyle kFavContacts = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  color: kTextColor1,
);

TextStyle kChatPeekText = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w600,
  color: kTextColor1,
);

//Border Radii

BorderRadius kOuterBorderRadius = BorderRadius.vertical(top: Radius.circular(30.0));

BorderRadius kChatTileBorderRadiusRight = BorderRadius.horizontal(right: Radius.circular(20.0));

BorderRadius kChatTileBorderRadiusLeft = BorderRadius.horizontal(left: Radius.circular(20.0));

BorderRadius kMaterialBorderRadius = BorderRadius.all(Radius.circular(30.0));