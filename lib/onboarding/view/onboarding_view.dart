import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitorapplication/core/route_constant.dart';
import 'package:visitorapplication/onboarding/controller/onboarding_controller.dart';


class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(height: 62,
                        width: 20,),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: TextStyle(
                              fontSize: 52, fontWeight: FontWeight.bold,color: Colors.lightGreenAccent),
                        ),
                        SizedBox(height: 52),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,

                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 170,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                      (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Colors.yellow
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 180,
              bottom: 60,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Next' : 'Next');
                }),
              ),
            ),
        Positioned(
          right: 10,
         top: 5,
           child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () { // Get.toNamed(RouteConstant.welcome);
                 },
              child: const Text('Skip'),
            ),

        )
          ],
        ),
      ),
    );
  }
}