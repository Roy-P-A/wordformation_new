import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../wordformer_controller.dart';

class DraggableSection extends StatelessWidget {
  const DraggableSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WordFormerController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return draggableElement(context, controller, index, constraints);
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: controller.options.length,
        );
      },
    );
  }

  Widget draggableElement(BuildContext context, WordFormerController controller,
      int index, BoxConstraints constraints) {
    final screenDimention = MediaQuery.of(context).size.shortestSide;
    final tab = screenDimention < 1100 && screenDimention >= 650;

    return Center(
      child: Draggable(
        data: controller.options[index],
        feedback: Center(
          child: Container(
            width: (GetPlatform.isDesktop || tab)
                ? constraints.maxWidth / controller.options.length / 3
                : constraints.maxWidth / controller.options.length / 2,
            height: (GetPlatform.isDesktop || tab)
                ? constraints.maxWidth / controller.options.length / 3
                : constraints.maxWidth / controller.options.length / 2,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF004AAD),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Align(
              child: Text(
                controller.options[index],
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        onDragStarted: () {
          controller.selectAnswerIndex(index);
        },
        onDragCompleted: () {
         // controller.selectAnswerIndex(index);
          controller.updateUserAnswerList(controller.options[index]);
        },
        childWhenDragging: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: constraints.maxWidth / controller.options.length,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0xFF004AAD),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Align(
                child: Text(
                  controller.options[index],
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: constraints.maxWidth / controller.options.length,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color(0xFF004AAD),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Align(
              child: Text(
                controller.options[index],
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
