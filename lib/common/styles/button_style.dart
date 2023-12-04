import 'package:flutter/material.dart';
import 'package:ayotani/common/styles/color_scheme.dart';

final elevatedButtonStyle = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

final outlinedButtonStyle = OutlinedButton.styleFrom(
  side: const BorderSide(color: primaryColor),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

final textButtonStyle = TextButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);
