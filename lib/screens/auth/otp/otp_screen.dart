import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ok_delivery/routes/routes.dart';
//import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:ok_delivery/utils/custom_color.dart';
import 'package:ok_delivery/utils/custom_style.dart';
import 'package:ok_delivery/utils/dimensions.dart';
import 'package:ok_delivery/utils/strings.dart';
import 'package:ok_delivery/widgets/buttons/default_button.dart';
import 'package:ok_delivery/widgets/custom_appbar.dart';
import 'package:ok_delivery/widgets/size.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen(this.phone, {super.key});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +251 ${widget.phone}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              controller: _pinPutController,
              pinAnimationType: PinAnimationType.fade,
              onCompleted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode!, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+251${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}

/* class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  Future registerUser(String mobile, BuildContext context) async {
    //instance of firebase
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
      phoneNumber: null,
      timeout: null!,
      verificationCompleted: null!,
      verificationFailed: null!,
      codeSent: null!,
      codeAutoRetrievalTimeout: null!,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget resendCode() {
      return RichText(
        text: TextSpan(
          text: Strings.noCode,
          style: TextStyle(
            fontSize: Dimensions.mediumTextSize,
            color: Colors.black.withOpacity(0.5),
          ),
          children: <TextSpan>[
            TextSpan(
              text: Strings.resendCode,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Get.toNamed();
                },
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
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
                Strings.codeSent,
                style: CustomStyle.defaultFontMediumBlackStyle,
              ),
            ),
            addVerticalSpace(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: CustomColor.secondaryColor,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(Dimensions.radius * .5),
                  selectedColor: CustomColor.secondaryColor,
                  activeColor: CustomColor.secondaryColor,
                  inactiveColor: CustomColor.secondaryColor,
                  fieldHeight: 55.h,
                  fieldWidth: 49.w,
                  activeFillColor: Colors.white,
                ),
                onChanged: (String value) {},
              ),
            ),
            addVerticalSpace(33.h),
            Padding(
              padding: EdgeInsets.only(left: 36.w, right: 35.2.w),
              child: SizedBox(
                width: 342.76.w,
                height: 55.h,
                child: DefaultButton(
                    title: Strings.submit,
                    onPresssed: () {
                      Get.toNamed(Routes.otpScreen);
                    }),
              ),
            ),
            addVerticalSpace(64.h),
            Center(child: resendCode()),
          ],
        ),
      ),
    );
  }
}
 */