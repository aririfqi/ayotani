// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ayotani/common/styles/color_scheme.dart';

class Utilities {
  static bool isKeyboardShowing() {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0;
  }

  static closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  /// Function to calculate user total daily nutritional needs (BMR)
  /// using the **Harris-Benedict Formula**

  /// Function to convert [dateTime] to time ago string format
  static String dateTimeToTimeAgo(DateTime dateTime) {
    if (dateTime.year == 0) return '?';

    timeago.setLocaleMessages('id', timeago.IdMessages());

    return toBeginningOfSentenceCase(timeago.format(dateTime, locale: 'id'))!;
  }

  /// Function to format [dateTime] to **d MMM y** string pattern
  static String dateTimeTodMMMy(DateTime dateTime) {
    if (dateTime.year == 0) return '?';

    return DateFormat('d MMM y').format(dateTime);
  }

  /// Function to encrypt [text] with **Salsa20 engine**
  static String encryptText(String text) {
    final key = encrypt.Key.fromLength(32);
    final iv = encrypt.IV.fromLength(8);

    final encrypter = encrypt.Encrypter(encrypt.Salsa20(key));
    final encrypted = encrypter.encrypt(text, iv: iv);

    return encrypted.base64;
  }

  /// Function to create snack bar with [message] as text that will be displayed.
  ///
  /// Its only create snackbar, not showing it.
  static SnackBar createSnackBar(String message) {
    return SnackBar(
      content: Text(message, style: GoogleFonts.plusJakartaSans()),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      duration: const Duration(seconds: 3),
    );
  }

  /// Function to show confirm dialog with two action button
  static void showConfirmDialog(
    BuildContext context, {
    required String title,
    required String question,
    required VoidCallback onPressedPrimaryAction,
    required VoidCallback onPressedSecondaryAction,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      transitionBuilder: (context, animStart, animEnd, child) {
        final curvedValue = Curves.ease.transform(animStart.value) - 3.8;
        final height = (MediaQuery.of(context).size.height / 8) * -1;

        return Transform(
          transform: Matrix4.translationValues(0, (curvedValue * height), 0),
          child: Opacity(
            opacity: animStart.value,
            child: Dialog(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      question,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          onPressed: onPressedSecondaryAction,
                          child: const Text(
                            'Batal',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 1,
                            thickness: 1,
                          ),
                        ),
                        TextButton(
                          onPressed: onPressedPrimaryAction,
                          child: const Text(
                            'Oke',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animStart, animEnd) => const SizedBox(),
    );
  }

  /// Function to show food schedule bottom sheet for adding user food schedule
}
