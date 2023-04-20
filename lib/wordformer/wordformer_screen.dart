import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:missing/wordformer/wordformer_controller.dart';

import '../widgets/dimensions.dart';
import '../widgets/tr_icon_button.dart';
import 'sections/wordformer_main_section.dart';

class WordFormerScreen extends StatelessWidget {
  const WordFormerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return GetBuilder<WordFormerController>(
        init: WordFormerController(),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/bg.png',
                  fit: BoxFit.fitWidth,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                SafeArea(
                  right: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WordFormerMainSection(controller: controller),
                        _sideMenu(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _sideMenu() {
    final WordFormerController controller = Get.find();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
            isEnabled: true,
            padding: EdgeInsets.zero,
            icon: Image.asset(
              "assets/images/buttons/go_back.png",
            ),
            iconSize: iconSize,
            onPressed: () {},
          ),
        ),
        const Spacer(),
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
            isEnabled: true,
            padding: EdgeInsets.zero,
            icon: Image.asset(
              "assets/images/buttons/repeat.png",
            ),
            iconSize: iconSize,
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
              isEnabled: true,
              padding: EdgeInsets.zero,
              icon: Image.asset(
                "assets/images/buttons/toffee_shot.png",
              ),
              iconSize: iconSize,
              onPressed: () {}),
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedOpacity(
          opacity: 1,
          duration: const Duration(microseconds: 300),
          child: TRIconButton(
              isEnabled: true,
              padding: EdgeInsets.zero,
              icon: Image.asset(
                "assets/images/buttons/done.png",
              ),
              iconSize: iconSize,
              onPressed: () {
                controller.onTappedDoneButton();
              }),
        ),
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            AnimatedOpacity(
              opacity: 1,
              duration: const Duration(microseconds: 300),
              child: TRIconButton(
                  isEnabled: true,
                  padding: EdgeInsets.zero,
                  icon: Image.asset(
                    "assets/images/buttons/skip.png",
                  ),
                  iconSize: iconSize,
                  onPressed: () {}),
            ),
          ],
        )
      ],
    );
  }
}
