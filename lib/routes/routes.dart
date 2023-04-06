import 'package:get/get.dart';
import 'package:ok_delivery/model/searching_ride_binding.dart';
import 'package:ok_delivery/model/splash_binding.dart';
import 'package:ok_delivery/screens/auth/sign_in/sign_in_screen.dart';
// import 'package:ok_delivery/screens/home/add_card_screen.dart';
// import 'package:ok_delivery/screens/home/available_driver_screen.dart';
// import 'package:ok_delivery/screens/home/cancel_trip_screen.dart';
// import 'package:ok_delivery/screens/home/chatting_screen.dart';
import 'package:ok_delivery/screens/home/destination_screen.dart';
import 'package:ok_delivery/screens/drawer/drawer_menu_screen.dart';
import 'package:ok_delivery/screens/home/home_screen.dart';
// import 'package:ok_delivery/screens/home/location_screen.dart';
// import 'package:ok_delivery/screens/home/payment_method_screen.dart';
import 'package:ok_delivery/screens/home/pickup_screen.dart';
// import 'package:ok_delivery/screens/profile/profile_screen.dart';
// import 'package:ok_delivery/screens/home/rate_driver_screen.dart';
// import 'package:ok_delivery/screens/home/ride_history_screen.dart';
// import 'package:ok_delivery/screens/home/searching_ride_screen.dart';
// import 'package:ok_delivery/screens/home/send_request_screen.dart';
import 'package:ok_delivery/screens/home/set_destination_screen.dart';
import 'package:ok_delivery/screens/home/set_pickup_location_screen.dart';
// import 'package:ok_delivery/screens/onboard/onboard.dart';
// import 'package:ok_delivery/screens/splash/splash_screen.dart';
import 'package:ok_delivery/screens/forgot_password/forgot_password_screen.dart';
import 'package:ok_delivery/screens/forgot_password/reset_password_screen.dart';
import 'package:ok_delivery/screens/auth/sign_in/signin_with_phone_screen.dart';
import 'package:ok_delivery/screens/introduction_screen.dart';
import '../screens/auth/otp/otp_screen.dart';
//import '../screens/auth/signup/signup_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onBoardScreen';
  static const String signInScreen = '/signInScreen';
  static const String signInWithPhoneScreen = '/signInWithPhoneScreen';
  static const String otpScreen = '/otpScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String signupScreen = '/signupScreen';
  static const String homeScreen = '/homeScreen';
  static const String locationScreen = '/locationScreen';
  static const String setPickupLocationScreen = '/setPickupLocationScreen';
  static const String pickupScreen = '/pickupScreen';
  static const String setDestinationScreen = '/setDestinationScreen';
  static const String destinationScreen = '/destinationScreen';
  static const String sendRequestScreen = '/sendRequestScreen';
  static const String searchRideScreen = '/searchRideScreen';
  static const String availableDriverScreen = '/availableDriverScreen';
  static const String paymentMethodScreen = '/paymentMethodScreen';
  static const String addCardScreen = '/addCardScreen';
  static const String chattingScreen = '/chattingScreen';
  static const String cancelTripScreen = '/cancelTripScreen';
  static const String rateDriverScreen = '/rateDriverScreen';
  static const String customDrawerMenuScreen = '/customDrawerMenuScreen';
  static const String profileScreen = '/profileScreen';
  static const String rideHistoryScreen = '/rideHistoryScreen';

  static var list = [
    GetPage(
      name: splashScreen,
      page: () => HomeScreen(), //const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: onboardScreen,
      page: () => const OnBoardingPage(),
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: signInWithPhoneScreen,
      page: () => SigninWithPhoneScreen(),
    ),
    GetPage(
      name: otpScreen,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: signupScreen,
      page: () => HomeScreen(), //SignupScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: locationScreen,
      page: () => HomeScreen(), //LocationScreen(),
    ),
    GetPage(
      name: setPickupLocationScreen,
      page: () => SetPickupLocationScreen(),
    ),
    GetPage(
      name: pickupScreen,
      page: () => PickupScreen(),
    ),
    GetPage(
      name: setDestinationScreen,
      page: () => SetDestinationScreen(),
    ),
    GetPage(
      name: destinationScreen,
      page: () => DestinationScreen(),
    ),
    GetPage(
      name: sendRequestScreen,
      page: () => HomeScreen(), //SendRequestScreen(),
    ),
    GetPage(
      name: searchRideScreen,
      page: () => HomeScreen(), //const SearchingRideScreen(),
      binding: SearchingRideBinding(),
    ),
    GetPage(
      name: availableDriverScreen,
      page: () => HomeScreen(), //const AvailableDrivercreen(),
    ),
    GetPage(
      name: paymentMethodScreen,
      page: () => HomeScreen(), //PaymentMethodScreen(),
    ),
    GetPage(
      name: addCardScreen,
      page: () => HomeScreen(), //AddCardScreen(),
    ),
    GetPage(
      name: chattingScreen,
      page: () => HomeScreen(), // ChattingScreen(),
    ),
    GetPage(
      name: cancelTripScreen,
      page: () => HomeScreen(), //CancelTripScreen(),
    ),
    GetPage(
      name: rateDriverScreen,
      page: () => HomeScreen(), //RateDriverScreen(),
    ),
    GetPage(
      name: customDrawerMenuScreen,
      page: () => const CustomDrawerMenuScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => HomeScreen(), // ProfileScreen(),
    ),
    GetPage(
      name: rideHistoryScreen,
      page: () => HomeScreen(), //const RideHistoryScreen(),
    ),
  ];
}
