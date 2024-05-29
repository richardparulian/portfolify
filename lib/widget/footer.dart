import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolify/constants.dart';
import '../configs/app_theme.dart';
import '../configs/app_typography.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      child: Center(
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              const TextSpan(text: "Developed in "),
              WidgetSpan(
                child: Image.network('https://img.icons8.com/?size=100&id=7I3BjCqe9rjG&format=png&color=000000',
                  scale: 5,
                ),
              ),
              const TextSpan(text: " with "),
              TextSpan(
                text: "Flutter",
                style: AppText.l1b!.copyWith(color: AppTheme.c!.primary),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // openURL("https://github.com/mhmzdev/DevFolio");
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
