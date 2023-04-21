import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../mixins/snackbar_mixin.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class WordFormerController extends GetxController with SnackbarMixin {
  List<dynamic> get question => [1, "L", "E", "P", "H", "A", "N", 2];
  List<String> get options => ["L", "E", "T", "M"];
  List<String> get correctAnswer => ["E", "L", "E", "P", "H", "A", "N", "T"];
  ByteData? imageBytes;

  String get heading => 'Word Formation';

  final _isDropped = false.obs;
  bool get isDropped => _isDropped.value;

  final _selectedAnswerIndex = 0.obs;
  int get indexOfAnswers => _selectedAnswerIndex.value;

  bool isSuccess = false;

  final _userAnswer = (List<dynamic>.empty(growable: true)).obs;
  List<dynamic> get userAnswer => _userAnswer;

  final _locateIndex = 0.obs;
  int get locateIndex => _locateIndex.value;

  @override
  void onInit() {
    for (int i = 0; i < question.length; i++) {
      _userAnswer.add(question[i]);
    }

    super.onInit();
  }

  @override
  void onReady() async {
    imageBytes = await rootBundle.load('assets/images/elephant.jpg');
    update();
    super.onReady();
  }

  void changeState() {
    _isDropped.value = true;
  }

  void selectAnswerIndex(int index) {
    _selectedAnswerIndex(index);
    print("selected answer $_selectedAnswerIndex");
  }

  void locateIndex1(int index) {
    _locateIndex.value = index;
    print("locate answer $_locateIndex");
  }

  void updateUserAnswerList(String data) {
    _userAnswer[locateIndex] = data;
    update();
    print(question);
    print(userAnswer);
  }

  onTappedDoneButton() {
    for (int i = 0; i < userAnswer.length; i++) {
      if (userAnswer[i] is int) {
        showErrorSnackbar(title: 'Error', message: 'Complete the word');
        return;
      }
    }
    Function deepEq = const DeepCollectionEquality().equals;
    isSuccess = deepEq(correctAnswer, userAnswer);
    if (isSuccess) {
      showSuccessSnackbar(
          title: 'Success', message: 'You got the correct answer');
    } else {
      showErrorSnackbar(title: 'Error', message: 'Incorrect answer');
    }
  }
}
