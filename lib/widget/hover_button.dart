import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../configs/app_theme.dart';
import '../configs/space.dart';
import '../provider/app_provider.dart';
import '../provider/scroll_provider.dart';

class HoverButton extends StatefulWidget {
  final int index;
  final String label;
  final Color hoverTextColor;

  const HoverButton({Key? key, required this.index, required this.label, required this.hoverTextColor}) : super(key: key);

  @override
  State<HoverButton> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverButton> {
  bool isHovered = false;

  void mouseEnter(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return MouseRegion(
      onEnter: (_) => mouseEnter(true),
      onHover: (_) => mouseEnter(true),
      onExit: (_) => mouseEnter(false),
      child: MaterialButton(
        splashColor: Colors.white54,
        highlightColor: Colors.white54,
        hoverColor: AppTheme.c!.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () {
          scrollProvider.scroll(widget.index);
        },
        child: Padding(
          padding: Space.all(1, 0.3),
          child: Text(widget.label,
            style: TextStyle(
              color: isHovered ? widget.hoverTextColor : appProvider.isDark ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
