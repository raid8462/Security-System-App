import 'dart:async';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:security_system/Components/custom_button.dart';
import 'package:security_system/home_page.dart';

class OTTScreen extends StatefulWidget {
  const OTTScreen({Key? key}) : super(key: key);

  @override
  State<OTTScreen> createState() => _OTTScreenState();
}

class _OTTScreenState extends State<OTTScreen> {
  // dialog box to get sms code
  Future<String?> getSmsCodeFromUser(BuildContext context) async {
    String? smsCode;

    // Update the UI - wait for the user to enter the SMS code
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('SMS code:'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Sign in'),
            ),
            OutlinedButton(
              onPressed: () {
                smsCode = null;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                smsCode = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
          ),
        );
      },
    );

    return smsCode;
  }

  bool isOTTVerified = false;
  Timer? timer;
  EmailOTP myAuth = EmailOTP();

  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  final pin3Controller = TextEditingController();
  final pin4Controller = TextEditingController();

  @override
  void initState() {
    if (!isOTTVerified) {
      sendOTTEmail();
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
    super.dispose();
  }

  sendOTTEmail() async {
    myAuth.setConfig(
      appEmail: 'test@gmail.com',
      appName: 'Security system',
      userEmail: FirebaseAuth.instance.currentUser?.email,
      otpLength: 4,
      otpType: OTPType.digitsOnly,
    );
    if (await myAuth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP has been sent"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Oops, OTP send failed"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) => isOTTVerified
      ? const HomePage()
      : Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black, size: 30),
            leading: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ),
          body: SafeArea(
            child: Form(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'lib/images/auth_animation.json',
                          width: 200,
                          height: 200,
                        ),
                        const Text(
                          "OTT Screen",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "One Time Token has been sent to your email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: pin1Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.titleLarge,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: pin2Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.titleLarge,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: pin3Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.titleLarge,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 68,
                              width: 64,
                              child: TextFormField(
                                controller: pin4Controller,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: Theme.of(context).textTheme.titleLarge,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        // button to verify ott
                        CustomButton(
                          onTap: () async {
                            if (await myAuth.verifyOTP(
                                  otp: pin1Controller.text +
                                      pin2Controller.text +
                                      pin3Controller.text +
                                      pin4Controller.text,
                                ) ==
                                true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("OTP is verified"),
                                ),
                              );
                              setState(() {
                                isOTTVerified = true;
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Invalid OTP"),
                                ),
                              );
                            }
                          },
                          buttonName: 'Verify',
                        ),
                        const SizedBox(height: 20),
                        // button to resend email ott
                        CustomButton(
                          onTap: () async {
                            myAuth.setConfig(
                              appEmail: 'test@gmail.com',
                              appName: 'Security system',
                              userEmail:
                                  FirebaseAuth.instance.currentUser?.email,
                              otpLength: 4,
                              otpType: OTPType.digitsOnly,
                            );
                            if (await myAuth.sendOTP() == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("OTP has been sent"),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Oops, OTP send failed"),
                              ));
                            }
                          },
                          buttonName: 'Resend OTT',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
}
