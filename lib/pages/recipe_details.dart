import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/biriyani_dish.jpg"), 
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
                ),
              ),
              Positioned(
                top: 5,
                left: 10,
                child: SafeArea( 
                  child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.focusColor.withOpacity(0.5), 
                    borderRadius: BorderRadius.circular(20.0), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), 
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2), 
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                ),
              ),
            ],
        ),        
       
        toolbarHeight: 280,
      ),
      body: SafeArea(
        child: Column(children: [],),
      ),
    );
  }
}