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
            return DragTarget(
              builder:
                  (context, candidateData, rejectedData) {
                return controller.isDropped
                    ? Container(
                        color: Colors.blue,
                        width: 100,
                        child: Text(
                          controller.options[
                              controller.indexOfAnswers],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration:
                                  TextDecoration.underline),
                        ),
                      )
                    : Container(
                        color: Colors.blue,
                        width: 100,
                        child: const Text("_____"),
                      );
              },
              onWillAccept: (data) {
                return data ==
                    controller
                        .options[controller.indexOfAnswers];
              },
              onAccept: (data) {
                controller.changeState();
                controller.locateIndex1(index);
              },
            );
          } else {
            return Container(
              color: Colors.blue,
              width: 100,
              child: Text(
                controller.question[index],
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 6,
            ),
        itemCount: controller.question.length);
  }
}

