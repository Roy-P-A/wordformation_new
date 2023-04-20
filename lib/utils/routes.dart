import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../wordformer/wordformer_screen.dart';


Widget _wrapWithMediaQuery({required Widget child}) {

  return child;
}

List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => const WordFormerScreen(),
          transition: Transition.cupertino),
    ];
