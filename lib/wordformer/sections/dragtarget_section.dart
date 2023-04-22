import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../wordformer_controller.dart';

class DragTargetection extends StatelessWidget {
  const DragTargetection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WordFormerController controller;

  @override
  Widget build(BuildContext context) {
    final screenDimention = MediaQuery.of(context).size.shortestSide;
    final tab = screenDimention < 1100 && screenDimention >= 650;
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: (GetPlatform.isDesktop || tab)
            ? constraints.maxHeight / 3
            : constraints.maxHeight / 2,
        child: Obx(
          () => ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (controller.userAnswer[index] is int) {
                  return dragTargetElement(controller, constraints, index);
                } else {
                   if(controller.question[index] is int)  {
                        return Obx(
                    () => Container(
                      padding: const EdgeInsets.all(2),
                      width:
                          constraints.maxWidth / controller.userAnswer.length,
                      color: Colors.blue,
                      child: Align(
                        child: Text(
                          controller.userAnswer[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white,decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  );
                   }
                   else{
                     return Obx(
                    () => Container(
                      padding: const EdgeInsets.all(2),
                      width:
                          constraints.maxWidth / controller.userAnswer.length,
                      color: Colors.blue,
                      child: Align(
                        child: Text(
                          controller.userAnswer[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  );

                   }
                  
                }
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: controller.userAnswer.length),
        ),
      );
    });
  }

  Widget dragTargetElement(
      WordFormerController controller, BoxConstraints constraints, int index) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return Obx(
          () => Container(
            padding: const EdgeInsets.all(2),
            width: constraints.maxWidth / controller.userAnswer.length,
            color: Colors.blue,
            child: Align(
              child: Text(
                // controller.isDropped
                //     ? controller.options[controller.indexOfAnswers]
                //     : 
                    
                    "__",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
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
