import 'package:flutter/material.dart';
import 'package:trailing_flutter/misc/colors.dart';
import 'package:trailing_flutter/widgets/app_large_text.dart';
import 'package:trailing_flutter/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/img/welcome-one.png',
    'assets/img/welcome-two.png',
    'assets/img/welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (BuildContext _, int index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: 'Trips'),
                      AppText(text: 'Mountain', size: 30),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text: 'Mountain hikes give you an incredible sense of freedom along with endurance test',
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                    ],
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
