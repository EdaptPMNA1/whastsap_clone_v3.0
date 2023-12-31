import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/custom_button.dart';
import 'package:not_whatsapp/Not%20Mycode/k_images.dart';
import 'package:not_whatsapp/Not%20Mycode/strings.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Utils.verticalSpace(20),
            Image.asset(
              KImages.communityImg,
            ),
            FittedBox(
              child: Text(
                KStrings.communityTitleText,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: hTextColor,
                ),
              ),
            ),
            Utils.verticalSpace(10),
            Text(
              KStrings.communityParagraphText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: subTitleTextColor,
              ),
            ),
            Utils.verticalSpace(10),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      foregroundColor: primaryColor,
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                  ),
                  onPressed: () {},
                  label: Text(KStrings.communityExampleText)),
            ),
            Utils.verticalSpace(30),
            CustomButton(
              text: KStrings.communityStartText,
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
