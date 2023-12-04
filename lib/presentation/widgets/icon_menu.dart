import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final String path;
  final bool isSecondRow;
  final Function onTap;

  const IconMenu({
    required this.path,
    this.isSecondRow = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 100,
      child: Material(
        color: const Color.fromARGB(0, 216, 5, 5),
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(path),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
