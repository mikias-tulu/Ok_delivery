import 'package:flutter/material.dart';
import 'package:ok_delivery/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ok_delivery/utils/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (context, constraints) {
          // Initialize ScreenUtil with the provided design size
          ScreenUtil.init(
            context,
            designSize: const Size(414, 896),
            //orientation: Orientation.portrait,
          );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: GetMaterialApp(
                title: Strings.appName,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  textTheme: GoogleFonts.robotoTextTheme(
                    Theme.of(context).textTheme,
                  ),
                ),
                navigatorKey: Get.key,
                initialRoute: Routes.onboardScreen,
                getPages: Routes.list,
              ),
            ),
          );
        },
      ),
    );
  }
}
