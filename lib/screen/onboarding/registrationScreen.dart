import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';

import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  Map<String, String> FormValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "cpassword": "",
  };
  bool Loading = false;

  InputOnChange(Mapkey, Textvalue) {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required !');
    } else if (FormValues['firstName']!.length == 0) {
      ErrorToast('firstName Required!');
    } else if (FormValues['lastName']!.length == 0) {
      ErrorToast('lastName Required!');
    } else if (FormValues['mobile']!.length == 0) {
      ErrorToast('mobile Required!');
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('Password Required!');
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast('Confirm Password  not same!');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await RegistrationRequest(FormValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        setState(
          () {
            Loading = false;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          SingleChildScrollView(
            child: Loading
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : (Container(
                    padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Join With US", style: Head1Text(Colors.black)),
                        SizedBox(height: 1),
                        Text("Learn with rabbil hasan",
                            style: Head6Text(Colors.black54)),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("email", Textvalue);
                          },
                          decoration: AppInputDecoration("Email Address"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("firstName", Textvalue);
                          },
                          decoration: AppInputDecoration("First Name"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("lastName", Textvalue);
                          },
                          decoration: AppInputDecoration("Last Name"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("mobile", Textvalue);
                          },
                          decoration: AppInputDecoration("Mobile"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("password", Textvalue);
                          },
                          decoration: AppInputDecoration("Password"),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (Textvalue) {
                            InputOnChange("cpassword", Textvalue);
                          },
                          decoration: AppInputDecoration("Confirm Password"),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Registration'),
                            onPressed: () {
                              FormOnSubmit();
                            },
                          ),
                        )
                      ],
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
