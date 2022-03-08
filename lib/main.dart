import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/pages/home.dart';
import 'package:laundry_app/pages/welcome.dart';
import 'package:laundry_app/pages/login.dart';
import 'package:laundry_app/pages/new_service.dart';
import 'package:laundry_app/pages/register.dart';
import 'package:laundry_app/pages/single_order.dart';
import 'package:laundry_app/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Laundry App",
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Welcome();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Login();
      });
    case "/register":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Register();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/new-service":
      return MaterialPageRoute(builder: (BuildContext context) {
        return NewService();
      });
    case "/single-order":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SingleOrder();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
