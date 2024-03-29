import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ok_delivery/routes/routes.dart';
import 'package:ok_delivery/screens/auth/otp/otp_screen.dart';
import 'package:ok_delivery/utils/custom_color.dart';
import 'package:ok_delivery/utils/custom_style.dart';
import 'package:ok_delivery/utils/dimensions.dart';
import 'package:ok_delivery/utils/strings.dart';
import 'package:ok_delivery/widgets/buttons/default_button.dart';
import 'package:ok_delivery/widgets/custom_appbar.dart';
import 'package:ok_delivery/widgets/input/default_input_text_field.dart';
import 'package:ok_delivery/widgets/size.dart';

class SigninWithPhoneScreen extends StatelessWidget {
  SigninWithPhoneScreen({Key? key}) : super(key: key);
  final TextEditingController phoneNumberController = TextEditingController();

  Widget acceptTerms() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: Strings.byTapping,
        style: TextStyle(
          fontSize: Dimensions.mediumTextSize,
          color: Colors.black.withOpacity(0.5),
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.terms,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Get.toNamed(Routes.signupScreen);
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: Strings.and,
          ),
          TextSpan(
            text: Strings.privacyPolicy,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Get.toNamed(Routes.signupScreen);
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: Strings.ofOkDelivery,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: CustomColor.screenBGColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                const CustomAppbar(
                  gapBetweenBackButtonAndTitle: 0.0,
                  gapBetweenTitlAndAppbar: 0.0,
                  title: "",
                ),
                addVerticalSpace(99.h),
                Padding(
                  padding: EdgeInsets.only(left: 36.w),
                  child: Text(
                    Strings.signInWithPhone,
                    style: CustomStyle.defaultFontMediumBlackStyle,
                  ),
                ),
                addVerticalSpace(20.h),
                Padding(
                  padding: EdgeInsets.only(left: 36.w),
                  child: SizedBox(
                    width: 343.w,
                    height: 55.h,
                    child: DefaultTextInputField(
                      controller: phoneNumberController,
                      hintText: Strings.phoneHint,
                      keyboardType: TextInputType.number,
                      icon: const Icon(
                        FontAwesomeIcons.phoneAlt,
                        color: CustomColor.customIconColorTwo,
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(33.h),
                Padding(
                  padding: EdgeInsets.only(left: 36.w, right: 35.2.w),
                  child: SizedBox(
                    width: 342.76.w,
                    height: 55.h,
                    child: DefaultButton(
                      title: Strings.continueText,
                      onPresssed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                OtpScreen(phoneNumberController.text)));
                      },
                    ),
                  ),
                ),
                addVerticalSpace(40.h),
                Center(
                  child: SizedBox(
                    width: 366.w,
                    height: 100.h,
                    child: acceptTerms(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
