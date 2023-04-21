import 'package:ok_delivery/routes/routes.dart';
import 'package:ok_delivery/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ok_delivery/utils/strings.dart';
import 'package:ok_delivery/widgets/buttons/default_button.dart';
import 'package:ok_delivery/widgets/custom_appbar.dart';
import 'package:ok_delivery/widgets/input/default_input_text_field.dart';
import 'package:ok_delivery/widgets/size.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  final TextEditingController destinationController1 = TextEditingController();
  final TextEditingController destinationController2 = TextEditingController();
  final TextEditingController destinationController3 = TextEditingController();
  final TextEditingController destinationController4 = TextEditingController();
  final TextEditingController destinationController5 = TextEditingController();
  final TextEditingController destinationController6 = TextEditingController();
  int currentTextFieldIndex = 2; // start with 2 additional text fields showing

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(
                gapBetweenBackButtonAndTitle: 66,
                gapBetweenTitlAndAppbar: 36,
                title: Strings.pickupscreenTitle,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.6),
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                      child: DefaultTextInputField(
                        controller: destinationController1,
                        hintText: Strings.setLocationHint,
                        keyboardType: TextInputType.text,
                        icon: const Icon(
                          Icons.my_location,
                          color: CustomColor.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    /*  SizedBox(
                      height: 55,
                      child: DefaultTextInputField(
                        controller: destinationController2,
                        hintText: Strings.destinationHint1,
                        keyboardType: TextInputType.text,
                        icon: const Icon(
                          Icons.location_on,
                          color: CustomColor.primaryColor,
                        ),
                      ),
                    ), */
                    _buildAdditionalTextField(),
                    addVerticalSpace(20.h),

                    //
                    Padding(
                      padding: EdgeInsets.only(
                        left: 36.0.w,
                        right: 35.2.w,
                      ),
                      child: SizedBox(
                        height: 55.h,
                        width: 342.76.w,
                        child: DefaultButton(
                            title: Strings.continueText,
                            onPresssed: () {
                              Get.toNamed(Routes.searchRideScreen);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalTextField() {
    if (currentTextFieldIndex <= 5) {
      List<Widget> textFields = [];
      for (int i = currentTextFieldIndex; i >= 2; i--) {
        switch (i) {
          case 5:
            textFields.add(
              SizedBox(
                height: 55,
                child: DefaultTextInputField(
                  controller: destinationController5,
                  hintText: Strings.destinationHint4,
                  keyboardType: TextInputType.text,
                  icon: const Icon(
                    Icons.location_on,
                    color: CustomColor.customIconColorTwo,
                  ),
                ),
              ),
            );
            break;
          case 4:
            textFields.add(
              SizedBox(
                height: 55,
                child: DefaultTextInputField(
                  controller: destinationController4,
                  hintText: Strings.destinationHint3,
                  keyboardType: TextInputType.text,
                  icon: const Icon(
                    Icons.location_on,
                    color: CustomColor.customIconColorTwo,
                  ),
                ),
              ),
            );
            break;
          case 3:
            textFields.add(
              SizedBox(
                height: 55,
                child: DefaultTextInputField(
                  controller: destinationController3,
                  hintText: Strings.destinationHint2,
                  keyboardType: TextInputType.text,
                  icon: const Icon(
                    Icons.location_on,
                    color: CustomColor.customIconColorTwo,
                  ),
                ),
              ),
            );
            break;
          case 2:
            textFields.add(
              SizedBox(
                height: 55,
                child: DefaultTextInputField(
                  controller: destinationController2,
                  hintText: Strings.destinationHint1,
                  keyboardType: TextInputType.text,
                  icon: const Icon(
                    Icons.location_on,
                    color: CustomColor.primaryColor,
                  ),
                ),
              ),
            );
            break;
        }
        if (i > 2) {
          textFields.add(SizedBox(height: 10));
        }
      }

      List<Widget> children = [
        const SizedBox(height: 20),
        ...textFields,
        if (currentTextFieldIndex < 5)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  currentTextFieldIndex++;
                });
              },
              icon: const Icon(Icons.add, size: 24),
              color: Colors.green,
            ),
          ),
      ];

      return Column(children: children);
    }
    return Container();
  }
}


/* class DestinationScreen extends StatelessWidget {
  DestinationScreen({Key? key}) : super(key: key);
  final TextEditingController destinationController1 = TextEditingController();
  final TextEditingController destinationController2 = TextEditingController();
  final TextEditingController destinationController3 = TextEditingController();
  final TextEditingController destinationController4 = TextEditingController();
  final TextEditingController destinationController5 = TextEditingController();
  final TextEditingController destinationController6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: mainStart,
              children: [
                const CustomAppbar(
                  gapBetweenBackButtonAndTitle: 66,
                  gapBetweenTitlAndAppbar: 36,
                  title: Strings.pickupscreenTitle,
                ),
                addVerticalSpace(40.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 35.6.w,
                    right: 35.6.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 55.h,
                        child: DefaultTextInputField(
                          controller: destinationController1,
                          hintText: Strings.setLocationHint,
                          keyboardType: TextInputType.text,
                          icon: const Icon(
                            Icons.my_location,
                            color: CustomColor.primaryColor,
                          ),
                        ),
                      ),
                      addVerticalSpace(20.h),
                      SizedBox(
                        height: 55.h,
                        child: DefaultTextInputField(
                          controller: destinationController2,
                          hintText: Strings.destinationHint1,
                          keyboardType: TextInputType.text,
                          icon: const Icon(
                            Icons.location_on,
                            color: CustomColor.primaryColor,
                          ),
                        ),
                      ),
                      addVerticalSpace(40.h),
                      SizedBox(
                        height: 55.h,
                        child: DefaultTextInputField(
                          controller: destinationController3,
                          hintText: Strings.destinationHint2,
                          keyboardType: TextInputType.text,
                          icon: const Icon(
                            Icons.location_on,
                            color: CustomColor.customIconColorTwo,
                          ),
                        ),
                      ),
                      addVerticalSpace(20.h),
                      SizedBox(
                        height: 55.h,
                        child: DefaultTextInputField(
                          controller: destinationController4,
                          hintText: Strings.destinationHint3,
                          keyboardType: TextInputType.text,
                          icon: const Icon(
                            Icons.location_on,
                            color: CustomColor.customIconColorTwo,
                          ),
                        ),
                      ),
                      addVerticalSpace(20.h),
                      SizedBox(
                        height: 55.h,
                        child: DefaultTextInputField(
                          controller: destinationController5,
                          hintText: Strings.destinationHint4,
                          keyboardType: TextInputType.text,
                          icon: const Icon(
                            Icons.location_on,
                            color: CustomColor.customIconColorTwo,
                          ),
                        ),
                      ),
                      addVerticalSpace(20.h),
                      SizedBox(
                        height: 55.h,
                        child: DefaultTextInputField(
                          controller: destinationController6,
                          hintText: Strings.destinationHint5,
                          keyboardType: TextInputType.text,
                          icon: const Icon(
                            Icons.location_on,
                            color: CustomColor.customIconColorTwo,
                          ),
                        ),
                      ),
                      addVerticalSpace(20.h),

                      //
                      Padding(
                        padding: EdgeInsets.only(
                          left: 36.0.w,
                          right: 35.2.w,
                        ),
                        child: SizedBox(
                          height: 55.h,
                          width: 342.76.w,
                          child: DefaultButton(
                              title: Strings.continueText,
                              onPresssed: () {
                                Get.toNamed(Routes.searchRideScreen);
                              }),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
 */