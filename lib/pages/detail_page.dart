import 'package:flutter/material.dart';
import 'package:trailing_flutter/misc/colors.dart';
import 'package:trailing_flutter/widgets/app_buttons.dart';
import 'package:trailing_flutter/widgets/app_large_text.dart';
import 'package:trailing_flutter/widgets/app_text.dart';
import 'package:trailing_flutter/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // top bg image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 320,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/mountain.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // icons
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu), color: Colors.white),
                ],
              ),
            ),
            // text information
            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // location title with the price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: 'Yosemite', color: Colors.black.withOpacity(0.8)),
                        AppLargeText(text: '\$ 250', color: AppColors.mainColor),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // location - icon & text
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: AppColors.mainColor),
                        const SizedBox(width: 10),
                        AppText(text: 'USA, California', color: AppColors.textColor1),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // stars & rate
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars ? AppColors.starColor : AppColors.textColor2,
                            );
                          }),
                        ),
                        const SizedBox(width: 10),
                        AppText(text: '(4.0)', color: AppColors.textColor2),
                      ],
                    ),
                    const SizedBox(height: 25),
                    AppLargeText(text: 'People', size: 20, color: Colors.black.withOpacity(0.8)),
                    const SizedBox(height: 5),
                    AppText(text: 'Number of people in your group', color: AppColors.mainTextColor),
                    const SizedBox(height: 10),
                    // button - number of people
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index ? Colors.white : Colors.black,
                              backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                              borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    AppLargeText(text: 'Description', size: 20, color: Colors.black.withOpacity(0.8)),
                    const SizedBox(height: 10),
                    AppText(
                      text: 'Yosemite National Park is located in central Sierra Nevada in the US state of California.',
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            // bottom app buttons
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: const [
                  AppButtons(
                    size: 60,
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    icon: Icons.favorite_border,
                    isIcon: true,
                  ),
                  SizedBox(width: 20),
                  ResponsiveButton(
                    isResponsive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}