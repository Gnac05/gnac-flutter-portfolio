import 'package:flutter/material.dart';
import 'package:gnac_flutter_portfolio/view/about-us/about_us_page.dart';
import 'package:gnac_flutter_portfolio/view/intro/introduction.dart';
import 'package:gnac_flutter_portfolio/view/main/main_view.dart';
import 'package:gnac_flutter_portfolio/view/projects/project_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MainView(pages: [
        const Introduction(),
        ProjectsView(),
        const AboutUsView(),
      ]),
    );
  }
}
