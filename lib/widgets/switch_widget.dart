import 'package:flutter/material.dart';
import 'package:laundry_app/utils/constants.dart';

class SwitchWidget extends StatefulWidget {
  final String leftLabel;
  final bool isSwitched;
  final Function onChanged;

  SwitchWidget({this.leftLabel = "", this.isSwitched = false, this.onChanged});

  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.leftLabel),
        SizedBox(
          width: 5.0,
        ),
        Switch(
          value: widget.isSwitched,
          onChanged: (value) {
            if (widget.onChanged != null) widget.onChanged(value);
          },
          activeColor: Constants.primaryColor,
          activeTrackColor: Constants.primaryLowerColor,
        )
      ],
    );
  }
}
