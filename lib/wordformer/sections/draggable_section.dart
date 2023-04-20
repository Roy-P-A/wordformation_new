import 'package:flutter/material.dart';
import '../wordformer_controller.dart';

class DraggableSection extends StatelessWidget {
  const DraggableSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WordFormerController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return draggableElement(context, controller, index);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      itemCount: controller.options.length,
    );
  }

  Widget draggableElement(
    BuildContext context,
    WordFormerController controller,
    int index,
  ) {
    return Draggable(
      data: controller.options[index],
      feedback: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFF004AAD),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white, width: 2),
          ),
          // width: 75,
          // height: 75,
          child: Text(
            controller.options[index],
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      onDragStarted: () {
        return controller.selectAnswerIndex(index);
      },
      onDragCompleted: () {
        controller.selectAnswerIndex(index);
        controller.updateUserAnswerList(controller.options[index]);
      },
      childWhenDragging: const SizedBox(),
      child: AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF004AAD),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Text(
              controller.options[index],
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
