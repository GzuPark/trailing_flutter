import 'package:flutter/cupertino.dart';
import 'package:trailing_flutter/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool? isResponsive;

  ResponsiveButton({
    Key? key,
    this.width,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/button-one.png'),
        ],
      ),
    );
  }
}
