import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:laundry_app/utils/constants.dart';
import 'package:laundry_app/utils/helper.dart';

import 'package:laundry_app/widgets/latest_orders.dart';
import 'package:laundry_app/widgets/location_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Dashboard _dashboard = new Dashboard();
  final Services _catalogServices = new Services();
  final Configuration _config = new Configuration();

  // Track active index
  int activeIndex = 0;
  Widget _showPage = new Dashboard();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
      case 2:
        return _dashboard;
        break;
      case 1:
        return _catalogServices;
        break;
      case 4:
        return _config;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: activeIndex,
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        items: [
          Icon(
            FlutterIcons.ios_home_ion,
            size: 30.0,
            color: activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.format_list_checkbox_mco,
            size: 30.0,
            color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.plus_ant,
            size: 30.0,
            color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.heart_fea,
            size: 30.0,
            color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.setting_ant,
            size: 30.0,
            color: activeIndex == 4 ? Colors.white : Color(0xFFC8C9CB),
          ),
        ],
        onTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
            activeIndex = index == 2 ? 0 : index;
          });

          if (index == 2) nextScreen(context, "/new-service");
        },
      ),
      backgroundColor: Constants.primaryColor,
      body: _showPage,
    );
  }
}

//Dashboard Widget
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                SizedBox(
                  height: kToolbarHeight,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Welcome Back,\n",
                                  style: Theme.of(context).textTheme.headline6.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                TextSpan(
                                  text: "FlutterPanda!",
                                  style: Theme.of(context).textTheme.headline6.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            "assets/images/dp.png",
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 200.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: Constants.scaffoldBackgroundColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "New Locations",
                          style: TextStyle(
                            color: Color.fromRGBO(19, 22, 33, 1),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Container(
                        height: ScreenUtil().setHeight(100.0),
                        child: Center(
                          // lets make a widget for the cards
                          child: LocationSlider(),
                        ),
                      ),
                      LatestOrders(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Services extends StatelessWidget {
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
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
              SizedBox(
                height: kToolbarHeight,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Catalog of prices",
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 200.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Constants.scaffoldBackgroundColor,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "Regular Service",
                        style: TextStyle(
                          color: Color.fromRGBO(19, 22, 33, 1),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                          height: ScreenUtil().setHeight(150.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color.fromRGBO(220, 233, 245, 1),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getItemRow("Kilogram of clothes", "20.00"),
                              getItemRow("Tower", "30.00"),
                              getItemRow("Pillow", "25.00"),
                              getItemRow("Shoes", "40.00"),
                            ],
                          )),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "Express Service",
                        style: TextStyle(
                          color: Color.fromRGBO(19, 22, 33, 1),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                          height: ScreenUtil().setHeight(150.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color.fromRGBO(220, 233, 245, 1),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getItemRow("Kilogram of clothes", "40.00"),
                              getItemRow("Tower", "60.00"),
                              getItemRow("Pillow", "50.00"),
                              getItemRow("Shoes", "80.00"),
                            ],
                          )),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Text(
                        "Extras",
                        style: TextStyle(
                          color: Color.fromRGBO(19, 22, 33, 1),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                          height: ScreenUtil().setHeight(60.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Color.fromRGBO(220, 233, 245, 1),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getItemRow("Delivery", "24.00"),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

Widget getItemRow(String item, String price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Expanded(
          child: Text(
            "$item",
            style: TextStyle(
              color: Color.fromRGBO(143, 148, 162, 1),
              fontSize: 15.0,
            ),
          ),
        ),
        Text(
          "\$$price",
          style: TextStyle(
            color: Color.fromRGBO(74, 77, 84, 1),
            fontSize: 15.0,
          ),
        )
      ],
    ),
  );
}

class Configuration extends StatelessWidget {
  Widget build(BuildContext context) {
    return SettingsList(
      contentPadding: EdgeInsets.only(top: kToolbarHeight),
      sections: [
        SettingsSection(
          title: Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            )
          ],
        ),
        SettingsSection(
          title: Text('Account'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.phone),
              title: Text('Phone number'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.email),
              title: Text('Email'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
            )
          ],
        )
      ],
    );
  }
}
