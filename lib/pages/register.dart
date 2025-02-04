import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:laundry_app/utils/constants.dart';
import 'package:laundry_app/utils/helper.dart';
import 'package:laundry_app/widgets/app_button.dart';
import 'package:laundry_app/widgets/input_widget.dart';

class Register extends StatelessWidget {
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
                              "Register your account",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
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
                            minHeight:
                                MediaQuery.of(context).size.height - 180.0,
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
                              // Lets make a generic input widget
                              InputWidget(
                                topLabel: "Name",
                                hintText: "Enter your name",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                topLabel: "Lastname",
                                hintText: "Enter your last name",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                topLabel: "Phone number",
                                hintText: "Enter your phone number",
                                keyboardType: "phone",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                topLabel: "Email",
                                hintText: "Enter your email address",
                                keyboardType: "email",
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              InputWidget(
                                topLabel: "Password",
                                obscureText: true,
                                hintText: "Enter your password",
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              InputWidget(
                                topLabel: "Confirm password",
                                obscureText: true,
                                hintText: "Enter your password again",
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              AppButton(
                                type: ButtonType.PRIMARY,
                                text: "Sign up",
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
