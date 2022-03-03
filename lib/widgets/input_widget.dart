import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/utils/constants.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final double height;
  final String topLabel;
  final String keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final Function validator;
  final Function onChanged;

  InputWidget(
      {this.hintText,
      this.prefixIcon,
      this.height = 48.0,
      this.topLabel = "",
      this.keyboardType = "text",
      this.obscureText = false,
      this.controller,
      this.onChanged,
      this.validator});

  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.topLabel),
        SizedBox(height: 5.0),
        Container(
          height: ScreenUtil().setHeight(widget.height),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: widget.controller,
            onChanged: (text) {
              if (widget.onChanged != null) widget.onChanged(text);
            },
            keyboardType: getKeyboardType(widget.keyboardType),
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon == null
                  ? widget.prefixIcon
                  : Icon(
                      widget.prefixIcon,
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
              hintText: widget.hintText,
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
