import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Map<String, String> FormValues = {"email": "", "password": ""};
  bool Loading = false;

  InputOnChange(Mapkey, Textvalue) {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required !');
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('Password Required!');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await LoginRequest(FormValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        setState(
          () {Loading = false;},
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
          Container(
            alignment: Alignment.center,
            child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get Started with", style: Head1Text(Colors.black)),
                  SizedBox(height: 1),
                  Text("Learn with rabbil hasan", style: Head6Text(Colors.grey)),
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
                      InputOnChange("password", Textvalue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild('Login'),
                      onPressed: () {
                        FormOnSubmit();
                      },
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/emailVerification');
                          }, child: Text("Forget Password?", style: Head6Text(Colors.black54),),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/registration');
                          }, child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have an account?", style: Head6Text(Colors.black54),),
                            Text("Sign UP", style: Head6Text(Colors.blue),),
                          ],
                        )
                        ),
                      ],
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
