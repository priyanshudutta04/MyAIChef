import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_chef/utils/bottom_pages_list.dart';
import 'package:my_ai_chef/utils/food_list.dart';
import 'package:my_ai_chef/widgets/bottom_nav.dart';
import 'package:my_ai_chef/widgets/sparkling_animation.dart';
import 'package:velocity_x/velocity_x.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedChipIndex = 0;
  
  late Map<String, List<String>> currentFoodList;

  @override
  void initState() {
    super.initState();

    currentFoodList = recomFoods;
  }

  void updateFoodList(int index) {
    switch (index) {
      case 0:
        currentFoodList = recomFoods;
        break;
      case 1:
        currentFoodList = breakfastFoods;
        break;
      case 2:
        currentFoodList = lunchFoods;
        break;
      case 3:
        currentFoodList = appetizerFoods;
        break;
      case 4:
        currentFoodList = dinnerFoods;
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,   
      appBar: AppBar(
         automaticallyImplyLeading: false,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          SparklingAnimation(
                            child: Positioned(
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
                          ),
                          
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    SizedBox(height: 15,),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, '/findRecipe');
                                      },
                                      child: Container(
                                        width: 100,
                                        height:30,
                                        decoration: BoxDecoration(
                                          color: context.theme.highlightColor,
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Center(child: Text("Generate Now",
                                          style: TextStyle(color: context.theme.cardColor),
                                        )),
                                      ),
                                    )
                                    
                                  ],
                                ),
                              ),
                              Spacer(),
                                        
                              Image.asset(
                              width: 120,
                              height: 150,
                              "assets/images/woman_chef.png",
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10,)
                              
                            ],
                          ),
                        ],
                      ),     
                  ),

                  SizedBox(height: 10,),

                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List<Widget>.generate(filterChips.length, (int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal:10),
                            child: FilterChip(
                              backgroundColor: context.theme.highlightColor,
                              showCheckmark: false,
                              selectedColor: context.theme.cardColor,
                              avatar: Image.asset(
                                width: 35,
                                height: 35,
                                filterChips.values.elementAt(index),
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),        
                              ),
                              side: BorderSide.none,
                              label: Text(
                                filterChips.keys.elementAt(index),
                                style: TextStyle(
                                  color: selectedChipIndex== index?context.theme.highlightColor:Colors.black
                                ),
                              ),
                              selected: selectedChipIndex == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  selectedChipIndex =  index;
                                  updateFoodList(selectedChipIndex);
                                });

                              },
                            ),
                          );
                        }),
                      ),
                    )
                  ),
              
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Based on the type of food you like",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: context.theme.splashColor),),
                  ),

                  
                    Padding(
                       padding: const EdgeInsets.only(bottom: 5),                  
                         child: GridView.builder( 
                          shrinkWrap: true,            
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, 
                              crossAxisSpacing: 15.0, 
                              mainAxisSpacing: 20.0,  
                              childAspectRatio: 1/1.43, 
                            ),
                            itemCount: currentFoodList.length,
                            itemBuilder: (context, index) {
                              String key = currentFoodList.keys.elementAt(index);
                              List<String>? values = currentFoodList[key];
                              return Container(
                                decoration: BoxDecoration(
                                   color: context.theme.highlightColor,
                                   borderRadius: BorderRadius.circular(15)
                                ),
                                
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Center(
                                      child: Image.asset(
                                      width: 120,
                                      height: 120,
                                      values![1],
                                      fit: BoxFit.cover,
                                    ),
                                  ),                
                                   Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                          key,
                                          style: TextStyle( fontSize: 16,fontFamily: 'FontMain'  ),
                                        ),
                                    ),                              
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                       values![0],
                                        style: TextStyle( fontSize: 14,color: context.theme.splashColor),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context, '/recipeDetails');
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            width: 85,
                                            height:25,
                                            decoration: BoxDecoration(
                                              color: context.theme.cardColor,
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Center(child: Text("View Recipe",
                                              style: TextStyle(color: context.theme.highlightColor),
                                            )),
                                          ),
                                        ),
                                        Text(
                                          values![2],
                                          style: TextStyle( fontSize: 14,color: context.theme.splashColor),
                                        ),
                                      ],
                                    ),
                                  
                                ],
                              ),
                              );
                            },
                            padding: const EdgeInsets.all(10.0),
                            physics: const BouncingScrollPhysics(),
                         ),
                       
                     ),                                      
              ],
            ),
          ),
        )
      ),
      bottomNavigationBar: BottomNav(
          pages: pages,
          selectedInd: 0,
      ),
    );
  }
}




