import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../controller/appData/appData.dart';
import '../../../widgets/customText.dart';

class CustomButtonContainer extends StatelessWidget {
  const CustomButtonContainer({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 390.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: Center(
        child: CustomTextWidget(
          title: title,
          textColor: whiteColor,
          fontS: 15,
          fontW: FontWeight.w600,
        ),
      ),
    );
  }
}