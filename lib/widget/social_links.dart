import 'package:flutter/material.dart';
import 'package:portfolify/configs/configs.dart';
import 'package:portfolify/constants.dart';
import 'package:portfolify/provider/app_provider.dart';
import 'package:portfolify/responsive/responsive.dart';
import 'package:portfolify/utils/utils.dart';
import 'package:provider/provider.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Wrap(
      runSpacing: AppDimensions.normalize(10),
      alignment: WrapAlignment.center,
      children: StaticUtils.socialIconURL.asMap().entries.map((e) {
        return Padding(
          padding: Responsive.isMobile(context) ? Space.all(0.2, 0) : Space.h!,
          child: IconButton(
            highlightColor: Colors.white54,
            splashRadius: AppDimensions.normalize(12),
            icon: Image.network(e.value,
              color: appProvider.isDark ? Colors.white : Colors.black,
              height: Responsive.isMobile(context) ? AppDimensions.normalize(10) : AppDimensions.normalize(10),
            ),
            iconSize: Responsive.isMobile(context) ? AppDimensions.normalize(10) : AppDimensions.normalize(10),
            onPressed: () => openURL(
              StaticUtils.socialLinks[e.key],
            ),
            hoverColor: AppTheme.c!.primary!,
          ),
        );
      }).toList(),
    );
  }
}