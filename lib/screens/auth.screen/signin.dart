import 'package:flutter/material.dart';
import 'loginpage.dart';



class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(''),
              Container(
                padding: EdgeInsets.symmetric(vertical: 55.0,horizontal: 23.0),
                width: double.infinity,
                height: 260.0,
                color: Colors.lightGreen.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ACCOUNT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 8.0,),
                    Text('Login/Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(height: 18.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LogInPage())
                        );
                      },
                      child: Center(
                        child: Container(
                          height: 50.0,
                          width: 365.0,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen.shade700,
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          ),

                          child: Center(
                            child: Text('LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ),
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
}
