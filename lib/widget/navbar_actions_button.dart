import 'package:flutter/material.dart';
import 'package:portfolify/animations/entrance_fader.dart';
import 'package:portfolify/configs/configs.dart';
import 'hover_button.dart';

class NavBarActionButton extends StatelessWidget {
  final String label;
  final int index;

  const NavBarActionButton({Key? key, required this.label, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: Space.h!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: HoverButton(
          index: index,
          label: label,
          hoverTextColor: Colors.white,
        ),
      ),
    );
  }
}
