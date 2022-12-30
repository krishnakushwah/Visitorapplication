import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitorapplication/core/model/onbording.dart';


class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/ONBOARDING1.jpg', 'PLANNING',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    OnboardingInfo('assets/ONBOARDING2.jpg', 'STARTUP',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    OnboardingInfo('assets/ONBOARDING3.jpg', 'SUCCESS',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry')
  ];
}