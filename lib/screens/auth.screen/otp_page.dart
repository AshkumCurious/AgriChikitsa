import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  List<String> otp = ['', '', '', '', '', ''];
  List<FocusNode> focusNodes = [];
  List<TextEditingController> textControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      focusNodes.add(FocusNode());
      textControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 6; i++) {
      focusNodes[i].dispose();
      textControllers[i].dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    setState(() {
      otp[index] = value;
      if (index < 5 && value.isNotEmpty) {
        focusNodes[index + 1].requestFocus();
      }
    });
  }

  void _onBackPressed(int index) {
    setState(() {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          title: Text('OTP Verification'),
        ),
      ),
      body: Column(
        children: [
          Text('ENTER OTP',
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                    (index) => SizedBox(
                  width: 40.0,
                  child: TextField(
                    controller: textControllers[index],
                    focusNode: focusNodes[index],
                    onChanged: (value) => _onTextChanged(index, value),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


