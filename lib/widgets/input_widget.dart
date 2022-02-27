import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/utils/constants.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final double height;
  final String topLabel;
  final String keyboardType;
  final bool obscureText;

  InputWidget({
    this.hintText,
    this.prefixIcon,
    this.height = 48.0,
    this.topLabel = "",
    this.keyboardType = "text",
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(this.topLabel),
        SizedBox(height: 5.0),
        Container(
          height: ScreenUtil().setHeight(height),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            keyboardType: getKeyboardType(keyboardType),
            obscureText: this.obscureText,
            decoration: InputDecoration(
              prefixIcon: this.prefixIcon == null
                  ? this.prefixIcon
                  : Icon(
                      this.prefixIcon,
                      color: Color.fromRGBO(105, 108, 121, 1),
                    ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(74, 77, 84, 0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Constants.primaryColor,
                ),
              ),
              hintText: this.hintText,
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(105, 108, 121, 0.7),
              ),
            ),
          ),
        )
      ],
    );
  }
}

TextInputType getKeyboardType(keyboardType) {
  switch (keyboardType) {
    case "phone":
      return TextInputType.phone;
    case "email":
      return TextInputType.emailAddress;
    case "number":
      return TextInputType.number;
    default:
      return TextInputType.text;
  }
}
