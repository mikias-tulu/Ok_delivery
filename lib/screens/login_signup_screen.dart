import 'package:flutter/material.dart';
import 'package:ok_delivery/utils/custom_style.dart';
import 'package:ok_delivery/utils/strings.dart';

import 'login_signup_screen/login_signup_form.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  static const String route = '/login-signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/images/okdelivery.jpg'),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 10),
                Text(Strings.appName,
                    style: CustomStyle.dialogueTitleTextStyle),
                const SizedBox(height: 20),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
