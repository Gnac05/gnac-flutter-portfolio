import 'package:flutter/material.dart';
import 'package:gnac_flutter_portfolio/view%20model/controller.dart';
// import 'package:gnac_flutter_portfolio/view%20model/responsive.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatefulWidget {
  const NavigationButtonList({super.key});

  @override
  State<NavigationButtonList> createState() => _NavigationButtonListState();
}

class _NavigationButtonListState extends State<NavigationButtonList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              NavigationTextButton(
                currentIndex: currentIndex,
                onTap: () {
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  setState(() {
                    currentIndex = 0;
                  });
                },
                text: 'Home',
                index: 0,
              ),
              // if (!Responsive.isLargeMobile(context))
              //   NavigationTextButton(
              //     currentIndex: currentIndex,
              //     onTap: () {},
              //     text: 'About us',
              //     index: 3,
              //   ),
              NavigationTextButton(
                currentIndex: currentIndex,
                onTap: () {
                  controller.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  setState(() {
                    currentIndex = 1;
                  });
                },
                text: 'Projects',
                index: 1,
              ),
              NavigationTextButton(
                currentIndex: currentIndex,
                onTap: () {
                  controller.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  setState(() {
                    currentIndex = 2;
                  });
                },
                text: 'About us',
                index: 2,
              ),
              // if (!Responsive.isLargeMobile(context))
              //   NavigationTextButton(
              //     currentIndex: currentIndex,
              //     onTap: () {},
              //     text: 'Achievements',
              //     index: 4,
              //   ),
            ],
          ),
        );
      },
    );
  }
}
