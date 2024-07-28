import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/views/common/exports.dart';
// import 'package:jobhub/views/common/height_spacer.dart';
//import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/ui/onboarding/widgets/page_one.dart';
import 'package:jobhub/views/ui/onboarding/widgets/page_three.dart';
import 'package:jobhub/views/ui/onboarding/widgets/page_two.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<OnBoardNotifier>(builder: (context, onBoardNotifier, child) {
        return Stack(
          children: [
            PageView(
              physics: onBoardNotifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (page) {
                onBoardNotifier.isLastPage = page == 2;
              },
              children: const [
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            ),

            //PAGE TRANSITION INDICATOR
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.49,
              left: 0,
              right: 0,
              child: onBoardNotifier.isLastPage
                  ? const SizedBox.shrink()
                  : Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: WormEffect(
                            dotHeight: 12,
                            dotWidth: 12,
                            spacing: 10,
                            dotColor: Color(kDarkGrey.value).withOpacity(0.5),
                            activeDotColor: Colors.green),
                      ),
                    ),
            ),
            //OPTIO FOR SKIP INTRO
            Positioned(
              child: onBoardNotifier.isLastPage
                  ? const SizedBox.shrink()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.jumpToPage(2);
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    "Skip",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 13,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              left: 0,
              right: 0,
              child: onBoardNotifier.isLastPage
                  ? const SizedBox.shrink()
                  : Center(
                      child: GestureDetector(
                          onTap: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 18,
                              color: Colors.white,
                            ),
                          )),
                    ),
            )
          ],
        );
      }),
    );
  }
}
