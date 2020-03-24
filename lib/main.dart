import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/model_meal.dart';
import 'views/view_filters/view_filters.dart';
import 'views/view_meal/view_meal.dart';
import 'views/view_meals/view_meals.dart';
import 'views/view_tabs/view_tabs.dart';
import 'views/view_home/view_home.dart';
import 'models/model_meals.dart';
import 'models/model_filter.dart';

void main() {
  Color mainColor = Colors.pink;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: mainColor));
  runApp(MyApp(mainColor));
}

class MyApp extends StatelessWidget {
  final Color mainColor;

  MyApp(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Meals()),
        ChangeNotifierProvider.value(value: Filter()),
      ],
      child: MaterialApp(
        title: 'Deli Meals',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: mainColor,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(240, 240, 240, 1),
          // Grey-ish background color
          textTheme: GoogleFonts.cabinTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            textTheme: GoogleFonts.cabinTextTheme(Theme.of(context).textTheme),
          ),
        ),
        routes: {
          '/': (_) => ViewTabs(), // This is the default, so no initialRoute: or home:
          ViewHome.route: (_) => ViewHome(),
          ViewMeals.route: (_) => ViewMeals(),
          ViewMeal.route: (_) => ViewMeal(),
          ViewFilters.route: (_) => ViewFilters(),
        },
        // onGenerateRoute: (settings) {},
        // onUnknownRoute: (settings) {},
      ),
    );
  }
}

// 29
