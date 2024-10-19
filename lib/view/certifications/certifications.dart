import 'package:flutter/material.dart';
import 'package:gnac_flutter_portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:gnac_flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/certification_grid.dart';

class Certifications extends StatelessWidget {
  final controller = Get.put(CertificationController());
  Certifications({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding / 3,
            ),
          const TitleText(prefix: 'Certifications & ', title: 'License'),
          const SizedBox(
            height: defaultPadding / 3,
          ),
          Expanded(
              child: Responsive(
            desktop: CertificateGrid(
              crossAxisCount: (width.floor()/275).floor(),
              ratio: 1.6
            ),
            extraLargeScreen: CertificateGrid(crossAxisCount: (width.floor()/275).floor(), ratio: 1.95),
            largeMobile: CertificateGrid(crossAxisCount: (width.floor()/275).floor(), ratio: 1.9),
            mobile: CertificateGrid(crossAxisCount: (width.floor()/275).floor(), ratio: 1.8),
            tablet: CertificateGrid(crossAxisCount: (width.floor()/275).floor(), ratio: 1.85),
          ))
        ],
      ),
    );
  }
}
