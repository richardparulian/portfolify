import 'package:flutter/cupertino.dart';
import 'package:portfolify/configs/app_dimensions.dart';

class ScrollProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  ScrollController get controller => scrollController;

  scroll(int index) {
    double offset = index == 1? 350 : index == 2 ? 325 : index == 3 ? 300 : 245;
    controller.animateTo(AppDimensions.normalize(offset * index.toDouble()),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  scrollMobile(int index) {
    double offset = index == 1 ? 290 : index == 2 ? 360 : index == 3 ? 300 : 310;
    controller.animateTo(AppDimensions.normalize(offset * index.toDouble()),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
