import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:my_ai_chef/widgets/charger_card.dart';
import 'package:my_ai_chef/widgets/pulsating_gradient.dart';

import 'package:velocity_x/velocity_x.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,   
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.theme.highlightColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: context.theme.cardColor,
                  child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          width: 30,
                          height: 30,
                          "assets/images/boy.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
        
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black,size: 16,),
                Text(
                  'Kolkata, India',
                  style: TextStyle(color: Colors.black,fontSize: 16), 
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: context.theme.highlightColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.bell, color: Colors.black,size: 22,),
              ), 
            ),
          ],
        ), 
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              children: [

                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: context.theme.canvasColor,
                        child: Icon(Icons.filter_list,color: context.theme.splashColor,)
                      ),
                    ),
                    hintText: 'Search by food name',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
         
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1.5, color: context.theme.cardColor)
                    ),
                    filled: true,
                    fillColor: context.theme.highlightColor
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: context.theme.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [                 
                      Positioned(
                        right: 0,
                        child: 
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5, 
                            height: 150, 
                            alignment: Alignment.centerRight, 
                             decoration: BoxDecoration(
                              color: context.theme.focusColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.elliptical(50, 70),
                                bottomLeft:  Radius.elliptical(50, 70),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10), 
                              )
                            ),
                          ),
                        ),
                      
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                            child: Column(
                              children: [
                                
                                 
                                Text(
                                    "Find your own recipe",
                                    style: TextStyle(
                                      color: context.theme.highlightColor,
                                      fontSize: 20
                                    ),
                                  ),
                                
                                
                                   
                                Text(
                                  "using AI Chef",
                                  style: TextStyle(
                                    color: context.theme.highlightColor,
                                    fontSize: 22
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}





