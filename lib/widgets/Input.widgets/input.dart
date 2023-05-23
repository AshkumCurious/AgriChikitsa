import 'package:flutter/material.dart';
import 'package:jobchecklist/res/color.dart';

class Input extends StatelessWidget {
 static const borderWidth = 2.0;
  const Input({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        // when text field is disabled i.e enabled: false
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:AppColor.lightColor,
            width: borderWidth,
          ),
        ),
        // when textField is inactive
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.lightColor,
            width: borderWidth,
          ),
        ),
        // when inputBox receive focous (when user clicks)
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.darkColor,
            width: borderWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.errorColor,
            width: borderWidth,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.errorColor,
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}
