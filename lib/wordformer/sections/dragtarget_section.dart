import 'package:flutter/material.dart';

import '../wordformer_controller.dart';

class DragTargetection extends StatelessWidget {
  const DragTargetection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WordFormerController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (controller.question[index] is int) {
            return dragTargetElement(index);
          } else {
            return AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.blue,
                  child: Text(
                    controller.question[index],
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            );
          }
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 6,
            ),
        itemCount: controller.question.length);
  }

  Widget dragTargetElement(int index) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return controller.isDropped
            ? AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.blue,
                    child: Text(
                      controller.options[controller.indexOfAnswers],
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              )
            : AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.blue,
                    child: Text(
                      "__",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              );
      },
      onWillAccept: (data) {
        return data == controller.options[controller.indexOfAnswers];
      },
      onAccept: (data) {
        controller.changeState();
        controller.locateIndex1(index);
      },
    );
  }
}
