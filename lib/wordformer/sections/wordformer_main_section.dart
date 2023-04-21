import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../utils/utils.dart';
import '../wordformer_controller.dart';
import 'draggable_section.dart';
import 'dragtarget_section.dart';

class WordFormerMainSection extends StatelessWidget {
  final WordFormerController controller;
  const WordFormerMainSection({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final smallmobile = MediaQuery.of(context).size.height < 500;
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: MediaQuery(
                  data: const MediaQueryData(textScaleFactor: 1),
                  child: Text(controller.heading,
                      style: smallmobile
                          ? AppTheme.activityTheme.textTheme.headline5
                          : AppTheme.activityTheme.textTheme.headline4),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: controller.imageBytes != null
                          ? AspectRatio(
                              aspectRatio: 1.5,
                              child: Image.memory(
                                controller.imageBytes!.buffer.asUint8List(),
                                fit: BoxFit.contain,
                              ))
                          : const CircularProgressIndicator(),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: DragTargetection(controller: controller),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: DraggableSection(controller: controller),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
