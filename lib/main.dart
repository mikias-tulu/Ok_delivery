import 'package:flutter/material.dart';
import 'package:ok_delivery/controller/user_state.dart';
import 'package:ok_delivery/providers/map_provider.dart';
import 'package:ok_delivery/providers/user_provider.dart';
import 'package:ok_delivery/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';
import 'package:ok_delivery/screens/login_signup_screen.dart';
import 'package:ok_delivery/screens/map_screen.dart';
import 'package:ok_delivery/screens/trips_screen.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';
import 'package:ok_delivery/utils/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(builder: (context, constraints) {
        // Initialize ScreenUtil with the provided design size
        ScreenUtil.init(
          context,
          designSize: const Size(414, 896),
          //orientation: Orientation.portrait,
        );

        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: UserProvider.initialize()),
            ChangeNotifierProvider.value(value: MapProvider())
          ],
          child: MaterialApp(
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
                initialRoute: Routes.userState,
                getPages: Routes.list,
                routes: {
                  UserState.route: (_) => const UserState(),
                  MapScreen.route: (_) => const MapScreen(),
                  LoginSignupScreen.route: (_) => const LoginSignupScreen(),
                  TripsScreen.route: (_) => const TripsScreen(),
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
