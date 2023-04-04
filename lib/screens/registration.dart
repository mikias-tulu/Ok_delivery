import 'package:flutter/material.dart';
import 'package:ok_delivery/utils/style.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _phoneController = TextEditingController();
  bool? _agreedToContinue = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: primaryColor,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: secondaryColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: Image.asset(
                            'assets/images/logo.png',
                          )),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Enter your phone number to register:',
                              style: TextStyle(fontSize: 18.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: 'Phone number',
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CheckboxListTile(
                              value: _agreedToContinue,
                              onChanged: (newValue) {
                                setState(() {
                                  _agreedToContinue = newValue;
                                });
                              },
                              title: const Text(
                                'I agree to terms and conditions',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: ElevatedButton(

                          //     onPressed: _agreedToContinue!
                          //         ? _continueButtonPressed
                          //         : null,
                          //     child: const Text('Continue'),
                          //   ),
                          // ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            // ignore: deprecated_member_use
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[600],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Continue",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.black,
                                      size: 26.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
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

  void _continueButtonPressed() {
    // TODO: Handle continue button press
  }
}
