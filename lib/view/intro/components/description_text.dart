import 'package:flutter/material.dart';

import '../../../view model/responsive.dart';

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});
  final double start;
  final double end;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Builder(builder: (context) {
          return SizedBox(
            width: Responsive.isMobile(context)
                ? 280
                : Responsive.isLargeMobile(context)
                    ? 430
                    : Responsive.isTablet(context)
                        ? 430
                        : 490,
            child: Text(
              // 'I\'m Serge GNACADJA and I\'m capable of creating excellent mobile apps, handling every step from concept to deployment.',
              // 'I\'m Serge GNACADJA and I\'m capable of creating${'\n'}excellent mobile apps, handling ${Responsive.isLargeMobile(context) ? '\n' : ''}every step from ${!Responsive.isLargeMobile(context) ? '\n' : ''}concept to deployment.',
              "I'm Serge GNACADJA, passionate about innovation and technology solutions. As an engineer in Mathematical Engineering and Modeling, I specialize in Flutter development. With strong experience in creating optimized mobile and web applications, I stand out by designing user interfaces that are both intuitive and high-performing. My goal is to turn your ideas into digital products that engage users and add value to your business.",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.grey, wordSpacing: 2, fontSize: value),
            ),
          );
        });
      },
    );
  }
}
