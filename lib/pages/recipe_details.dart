import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {

  final Map<IconData, String> iconTextMap = {
    FontAwesomeIcons.clock: "60 mins",
    FontAwesomeIcons.chartLine: "Medium",
    FontAwesomeIcons.fire: "229 Calorie",
  };
    final List<Map<String, String>> dataList = [
    {
      'imageUrl': 'assets/images/recipe-item1.jpeg',
      'title': 'Basmati Rice',
      'description': '600 g',
    },
    {
      'imageUrl': 'assets/images/recipe-item2.jpeg',
      'title': 'Chicken',
      'description': '500 g',
    },
    {
      'imageUrl': 'assets/images/recipe-item3.jpeg',
      'title': 'Onion',
      'description': '200 g',
    },
    {
      'imageUrl': 'assets/images/recipe-item4.jpeg',
      'title': 'Yogurt',
      'description': '150 g',
    },
    {
      'imageUrl': 'assets/images/recipe-item5.jpeg',
      'title': 'Ghee',
      'description': '100 g',
    },
    {
      'imageUrl': 'assets/images/recipe-item6.jpeg',
      'title': 'Biryani Masala',
      'description': '30 g',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/biriyani_dish2.jpg"), 
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
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
                    icon: Icon(Icons.arrow_back, color: context.theme.highlightColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                ),
              ),
              Positioned(
                bottom: 0, 
                left: 0,
                right: 0, 
                child: Container(
                  height: 30, 
                  decoration: BoxDecoration(
                    color: context.theme.canvasColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                  ),       
                ),
              )
            ],
        ),        
        toolbarHeight: 280,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chiken Biriyani",
                            style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,fontFamily: 'FontMain')
                            ),
                            Text("Mughal Dish",
                            style: TextStyle(fontSize: 16,fontFamily: 'FontMain',color:context.theme.splashColor)
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.star, size: 28, color: context.theme.focusColor), 
                        SizedBox(width: 8), 
                        Text(
                          "4.9", 
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),           
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: iconTextMap.entries.toList().asMap().entries.map((entry) {
                        int index = entry.key;
                        MapEntry<IconData, String> iconEntry = entry.value;    
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 0 : 15.0), 
                          child: Row(
                            children: [
                              Icon(iconEntry.key, size: 18, color: Color.fromARGB(255, 201, 201, 201)), 
                              SizedBox(width: 8), 
                              Text(
                                iconEntry.value, 
                                style: TextStyle(fontSize: 14,color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Description",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,fontFamily: 'FontMain')
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Aromatic and flavorful, chicken biryani is a fragrant rice dish bursting with tender chicken pieces, spices, and saffron, creating a truly satisfying meal.",
                      style: TextStyle(fontSize: 14,fontFamily: 'FontMain',color:context.theme.splashColor)
                    ),
            
                    SizedBox(
                      height: 25,
                    ),
                    Text("Ingredients",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,fontFamily: 'FontMain')
                    ),
                    SizedBox(
                      height: 10,
                    ),
             
                    ListView.builder(
                      shrinkWrap: true,  
                      physics: const BouncingScrollPhysics(),
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final item = dataList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            color: context.theme.canvasColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [               
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    item['imageUrl']!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),                                   
                                  Text(
                                    item['title']!,
                                    style: TextStyle(
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  SizedBox(height: 5),
                                  Text(
                                    item['description']!,
                                    style: TextStyle(fontSize: 16),
                                  ),                                           
                              ],
                            ),
                          ),
                        );
                      },
                    ),   
                    SizedBox(height: 20,)      
                  ],
                ),
              ),
            ),
             Positioned(
              left: 70,
              right: 70,
              bottom: 20, 
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.circlePlay, size: 26, color: context.theme.highlightColor),
                    SizedBox(width: 10),
                    Text(
                      "Watch Video",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: context.theme.highlightColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
          
      ),
    );
  }
}