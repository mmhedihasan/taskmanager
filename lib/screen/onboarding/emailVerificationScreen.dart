import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';

import '../../style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {

  Map<String, String> FormValues = {"email": ""};
  bool Loading = false;

  InputOnChange(Mapkey, Textvalue) {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required !');
    } else {
      setState(() {
        Loading = true;
      });
      bool res = await VerifyEmailRequest(FormValues['email']);
      if (res == true) {
        Navigator.pushNamed(context, '/pinVerification');
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
                 Text("Your Email Address", style: Head1Text(Colors.black)),
                 SizedBox(height: 1),
                 Text("A 6 Digit Pin Number set your email Address", style: Head6Text(Colors.grey)),
                 SizedBox(height: 20),
                 TextFormField(
                   onChanged: (Textvalue) {
                     InputOnChange("email", Textvalue);
                   },
                   decoration: AppInputDecoration("Email Address"),
                 ),
                 SizedBox(height: 20),
                 Container(
                   child: ElevatedButton(
                     style: AppButtonStyle(),
                     child: SuccessButtonChild('Next'),
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
