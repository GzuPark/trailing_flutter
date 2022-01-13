import 'package:flutter/material.dart';
import 'package:trailing_flutter/misc/colors.dart';
import 'package:trailing_flutter/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final double? width;
  final bool? isResponsive;

  const ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 25), child: AppText(text: 'Book Trip Now', color: Colors.white))
                : Container(),
            Image.asset('assets/img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
