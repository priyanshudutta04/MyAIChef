

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ai_chef/pages/blogs.dart';
import 'package:my_ai_chef/pages/check_availability.dart';
import 'package:my_ai_chef/pages/choose_charger.dart';
import 'package:my_ai_chef/pages/get_started.dart';
import 'package:my_ai_chef/pages/home.dart';
import 'package:my_ai_chef/pages/payment.dart';
import 'package:my_ai_chef/pages/payment_done.dart';
import 'package:my_ai_chef/pages/profile.dart';
import 'package:my_ai_chef/pages/recipe_details.dart';
import 'package:my_ai_chef/pages/recipes.dart';
import 'package:my_ai_chef/pages/station_details.dart';
import 'package:my_ai_chef/utils/routes.dart';
import 'package:my_ai_chef/utils/themes.dart';
import 'package:provider/provider.dart';

void main() async{
  
  runApp( MyApp());
}


// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  //const MyApp({super.key});

  bool isSwitched;
  MyApp({Key? key, this.isSwitched=false}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromRGBO(244, 244, 244, 1),
      statusBarColor: Color.fromRGBO(244, 244, 244, 1),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

    
    return MaterialApp(
      
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      
      //themeMode: ThemeMode.system,                       // setting the theme

      debugShowCheckedModeBanner: false,              //removes debug banner

      initialRoute: "/",                              //this route will open first
      
      routes: {                                       //creating routes for different pages in app
        "/": (context) => HomePage(),                //main root 
        Myroutes.chargerRoute: (context) => ChooseCharger(),
        Myroutes.getStartedRoute: (context) => GetStarted(),
        Myroutes.homeRoute: (context) => HomePage(),
        Myroutes.stationDetailsRoute: (context) => StationDetails(),
        Myroutes.availabilityRoute: (context) => CheckAvailability(),
        Myroutes.paymentRoute: (context) => PaymentPage(),
        Myroutes.paymentDoneRoute: (context) => PaymentDone(),
        Myroutes.blogsRoute: (context) => BlogsPage(),
        Myroutes.recipesRoute: (context) => RecipesPage(),
        Myroutes.profileRoute: (context) => ProfilePage(),
        Myroutes.recipeDetailsRoute: (context) => RecipeDetails(),
      },
    );   
  }
  );
}

