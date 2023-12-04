import 'package:flutter/material.dart';
import 'package:ayotani/common/styles/color_scheme.dart';

// ignore: must_be_immutable
class SearchEmpty extends StatelessWidget {
  IconData icon;
  String title;

  SearchEmpty({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: primaryColor,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
