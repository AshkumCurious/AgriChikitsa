import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobchecklist/screens/auth.screen/otp_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool? isChecked = true;
  TextEditingController controller = TextEditingController();
  var phone="";
  bool continuebutton=false;
  Color _containerColor = Colors.grey; // Initial color

  void changeColor(bool b) {
    setState(() {
      if(b==true)
       _containerColor = Colors.green;
      else if(b==false)
        _containerColor = Colors.grey;
    });
  }
  validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      print('Please enter mobile number');
    }
    else if (!regExp.hasMatch(value)) {
      print('Please enter valid mobile number');
      bool continuebutton = false;
      changeColor(continuebutton);
    }
      else {
      bool continuebutton = true;
      changeColor(continuebutton);
    }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10.0,),
              Image.asset('assets/images/img_1.png',
                height: 100.0,
                width: 100.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 55.0, horizontal: 23.0),
                width: double.infinity,
                height: 350.0,
                color: Color(0xFFE4EFE7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Enter your phone number to proceed',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          phone=value;
                          validateMobile(phone);
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                         labelText: '+91',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: '+91'+phone,
                          verificationCompleted: (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId, int? resendToken) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OTPPage())
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      },
                      child: Center(
                        child: Container(
                          height: 50.0,
                          width: 365.0,
                          decoration: BoxDecoration(
                            color: _containerColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                          ),
                          child: Center(
                            child: Text(
                              'CONTINUE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(value: isChecked, onChanged: (bool? newValue){
                          setState(() {
                            isChecked = newValue;
                          });
                        },
                        visualDensity: VisualDensity.compact,
                        ),
                        Text(
                          'accept the ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          'Terms & Conditions ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          'and ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                          ),
                        ),
                      ],
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
}
