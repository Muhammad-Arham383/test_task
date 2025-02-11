import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Home after 2 seconds
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Image.asset(
            'assets/images/splashScreen.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: screenWidth,
          height: screenHeight,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.2, 0.7, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.black.withAlpha(29),
                const Color.fromARGB(175, 17, 17, 17),
                Colors.black
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.06),
            child: Text(
              "My Store",
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.1,
          left: screenWidth * 0.01,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        'Valkommen',
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 245, 241, 241),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        """                  Hos ass kan du baka tid has nastan alla
                    Sveriges salonger och motagningar. Baka 
                  frisor, massage,skonhetsbehandingar,
                             friskvard och mycket mer.""",
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 220, 215, 215),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
