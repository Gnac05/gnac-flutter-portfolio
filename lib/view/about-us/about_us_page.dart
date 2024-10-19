import 'package:flutter/material.dart';
import 'package:gnac_flutter_portfolio/res/constants.dart';
import 'package:gnac_flutter_portfolio/view/main/components/drawer/drawer.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fond sombre
      drawer: const CustomDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'About Me', // Titre personnel
                        style: TextStyle(
                          fontSize: constraints.maxWidth > 600 ? 48 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Texte clair pour contraste
                          shadows: const [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.blueAccent,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.withOpacity(0.7),
                              spreadRadius: 5,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            width: constraints.maxWidth > 600 ? 200 : 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "I’m a passionate Flutter developer with a deep love for creating beautiful, functional mobile and web applications. Over the years, I’ve honed my skills in building user-friendly, responsive UIs with smooth animations.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 24 : 16,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "I'm always open to new opportunities and love collaborating on interesting projects. Let's build something amazing together!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 24 : 16,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      borderRadius: BorderRadius.circular(defaultPadding + 10),
                      child: Container(
                        height: 35,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(defaultPadding),
                            gradient: const LinearGradient(colors: [
                              Colors.pink,
                              Color.fromARGB(255, 42, 42, 43),
                            ]),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(0, -1),
                                  blurRadius: defaultPadding / 4),
                              BoxShadow(
                                  color: Colors.red,
                                  offset: Offset(0, 1),
                                  blurRadius: defaultPadding / 4),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/eagle.png'),
                                  colorFilter: ColorFilter.mode(
                                    Colors.green,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: defaultPadding / 4),
                            Text(
                              'See More',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
