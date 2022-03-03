import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:laundry_app/utils/constants.dart';
import 'package:laundry_app/utils/helper.dart';
import 'package:laundry_app/widgets/app_button.dart';
import 'package:laundry_app/widgets/input_widget.dart';
import 'package:laundry_app/widgets/switch_widget.dart';

class NewService extends StatefulWidget {
  @override
  _NewServiceState createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/images/washing_machine_illustration.png",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                FlutterIcons.keyboard_backspace_mdi,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "New service",
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height - 180.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SwitchWidget(
                                  leftLabel: "Express service",
                                  isSwitched: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  }),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                !isSwitched
                                    ? "The service will be ready maximum the next day at noon."
                                    : "The service will be ready from 3 hrs. to 5 hours (Depending on the volume sent)",
                                style: TextStyle(
                                  color: Color.fromRGBO(74, 77, 84, 1),
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Divider(),
                              InputWidget(
                                topLabel: "Address",
                                hintText: "Enter your full address",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                topLabel: "Address reference",
                                obscureText: true,
                                hintText: "e.g. A store next door.",
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              AppButton(
                                type: ButtonType.PRIMARY,
                                text: "Request service",
                                onPressed: () {
                                  nextScreen(context, "/dashboard");
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
