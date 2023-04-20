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
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
                flex: 1,
                child: Center(
                  child: MediaQuery(
                    data: const MediaQueryData(textScaleFactor: 1),
                    child: HtmlWidget(
                      controller.heading,
                      textStyle: smallmobile
                          ? AppTheme.activityTheme.textTheme.headline5
                              ?.copyWith(color: const Color(0xFF16313D))
                          : AppTheme.activityTheme.textTheme.headline3
                              ?.copyWith(color: const Color(0xFF16313D)),
                    ),
                  ),
                ),
              ),
          SizedBox(
            height: constraints.maxHeight/2,
            child: Row(
              children: [
                const SizedBox(
                  height: 200,
                  width:200,
                  child: Placeholder(),
                ),
                SizedBox(
                  width: 200,
                  child: DragTargetection(controller: controller),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 600,
            height: constraints.maxHeight/4,
            child: DraggableSection(controller: controller),
          ),
        ],
      );
    });
  }
}
