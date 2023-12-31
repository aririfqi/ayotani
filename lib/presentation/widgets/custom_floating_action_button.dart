import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ayotani/common/styles/color_scheme.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          elevation: 0,
          focusElevation: 4,
          hoverElevation: 4,
          highlightElevation: 8,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(250, 128, 175, 27),
                  Color.fromARGB(249, 104, 139, 27)
                ],
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: secondaryColor,
                  offset: Offset(0.0, 8.0),
                  blurRadius: 10,
                )
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, left: 4),
                child: SvgPicture.asset('assets/svg/nutri_check.svg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
