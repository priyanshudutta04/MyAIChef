import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ai_chef/pages/blogs.dart';
import 'package:my_ai_chef/pages/find_recipe.dart';
import 'package:my_ai_chef/pages/get_started.dart';
import 'package:my_ai_chef/pages/home.dart';
import 'package:my_ai_chef/pages/profile.dart';
import 'package:my_ai_chef/pages/recipe_details.dart';
import 'package:my_ai_chef/pages/recipes.dart';
import 'package:my_ai_chef/utils/routes.dart';
import 'package:my_ai_chef/utils/themes.dart';
import 'package:provider/provider.dart';

mixin Previewer {
  void preview() {
    print('Previewing...');
  }
}

class DevicePreviewProvider extends StatelessWidget with Previewer {
  const DevicePreviewProvider({super.key});

  @override
  Widget build(BuildContext context) {
    preview(); // Using the mixin method
    return Container();
  }
}

void main() async{
  runApp(MyApp());
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

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
        "/": (context) => const GetStarted(),                //main root 
        Myroutes.getStartedRoute: (context) => const GetStarted(),
        Myroutes.homeRoute: (context) => const HomePage(),
        Myroutes.blogsRoute: (context) => const BlogsPage(),
        Myroutes.recipesRoute: (context) => const RecipesPage(),
        Myroutes.profileRoute: (context) => const ProfilePage(),
        Myroutes.recipeDetailsRoute: (context) => const RecipeDetails(),
        Myroutes.findRecipeRoute: (context) => const FindRecipe(),
      },
    );   
  }
  );
}

