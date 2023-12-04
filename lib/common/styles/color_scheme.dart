import 'package:flutter/material.dart';

// Colors
const primaryColor = Color.fromARGB(248, 124, 170, 25);
const secondaryColor = Color.fromARGB(255, 212, 229, 176);
const primaryBackgroundColor = Color(0XFFFFFFFF);
const secondaryBackgroundColor = Color.fromARGB(248, 124, 170, 25);
const scaffoldBackgroundColor = Color(0XFFF5F6FA);
const primaryTextColor = Color(0XFF2E3142);
const secondaryTextColor = Color(0XFF9C9DB9);
const dividerColor = Color(0XFFD2D1E1);
const errorColor = Color(0XFFF9877B);
const ratingColor = Color.fromARGB(203, 243, 101, 0);

const Color backgroundPink = Color(0xffDB65B8);
const Color unguColor = Color.fromARGB(255, 238, 218, 246);
const Color appBarUngu = Color(0xffC948A3);
const Color bundaranUngu = Color(0xff94B2EB);
const Color subtitleBiru = Color(0xff50ACDF);
const Color infoColor = Color.fromARGB(255, 112, 205, 255);
const Color subtitleHitam = Color(0xff56595A);
const Color orangeTua = Color.fromARGB(255, 217, 216, 216);
const Color orangeMuda = Color.fromARGB(255, 217, 216, 216);
const Color hijauMuda = Color(0xffAFF198);
const Color hijauTua = Color(0xff30C13E);
const Color merahBox = Color(0xffFD4343);
const Color putih = Color(0xffFFFFFF);

const Color ibuBersalinColor = Color(0xffFFFFFF);
const Color ibuHamilColor = Color(0xffFFFFFF);
const Color ibuNifasColor = Color(0xffFFFFFF);
const Color keluargaBerencanaColor = Color(0xffFFFFFF);
const Color catatanColor = Color(0xffFFFFFF);
const Color pinkpudar = Color.fromARGB(255, 219, 146, 236);

// Color scheme
final colorScheme = ColorScheme.fromSeed(
  seedColor: primaryColor,
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryBackgroundColor,
  secondary: secondaryColor,
  onSecondary: primaryColor,
  background: primaryBackgroundColor,
  onBackground: primaryTextColor,
  error: errorColor,
  errorContainer: errorColor,
);

// Gradient color used for alarm schedule background color
class GradientColors {
  final List<Color> colors;

  const GradientColors(this.colors);

  static const List<Color> morning = <Color>[
    secondaryBackgroundColor,
    Color.fromARGB(255, 58, 199, 241),
  ];

  static const List<Color> day = <Color>[
    primaryColor,
    Color.fromARGB(255, 35, 157, 194),
  ];

  static const List<Color> night = <Color>[
    Color(0XFF444974),
    Color.fromARGB(255, 12, 82, 104),
  ];
}

// Gradient templates
const gradientTemplates = <GradientColors>[
  GradientColors(GradientColors.morning),
  GradientColors(GradientColors.day),
  GradientColors(GradientColors.night),
];
