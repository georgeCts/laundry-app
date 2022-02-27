import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/utils/constants.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;

  AppButton({this.type, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: getButtonColor(type),
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Color.fromRGBO(169, 176, 185, 0.42),
        elevation: 2.0,
        child: InkWell(
          child: Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(48.0),
            child: Center(
              child: Text(
                this.text,
                style: GoogleFonts.roboto(
                  color: getTextColor(type),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          onTap: this.onPressed,
        ));
  }
}

Color getButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      return Constants.primaryColor;
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return Constants.primaryColor;
  }
}

Color getTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return Constants.primaryColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      return Colors.white;
  }
}

Color getHoverColor(ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return Constants.primaryColor;
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      return Colors.white;
  }
}
