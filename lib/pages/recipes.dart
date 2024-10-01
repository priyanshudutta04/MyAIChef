import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_chef/utils/bottom_pages_list.dart';
import 'package:my_ai_chef/utils/food_list.dart';
import 'package:my_ai_chef/widgets/bottom_nav.dart';
import 'package:velocity_x/velocity_x.dart';



class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

   @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase(); 
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: SafeArea(  
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: context.theme.canvasColor,
                        child: Icon(
                          Icons.filter_list,
                          color: context.theme.splashColor,
                        ),
                      ),
                    ),
                    hintText: 'Search by food name',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 1.5, color: context.theme.cardColor),
                    ),
                    filled: true,
                    fillColor: context.theme.highlightColor,
                  ),
                ),
                SizedBox(height: 20,),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Text("View All Recipes",
                //   style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24),)
                // ),


                Expanded(
                  child: ListView.builder(                         
                    itemCount: filterChips.length,
                    itemBuilder: (context, index) {
                      final category = filterChips.keys.elementAt(index);
                      final foodMap = _getFoodMap(category);
                      final filteredFoodMap = foodMap.entries.where((entry) =>entry.key.toLowerCase().contains(_searchQuery)).toList();
                  
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [           
                          ListView.builder(
                            shrinkWrap: true, 
                            physics: NeverScrollableScrollPhysics(), 
                            itemCount: filteredFoodMap.length,
                            itemBuilder: (context, foodIndex) {
                              final foodName = filteredFoodMap[foodIndex].key;
                              final foodDetails = filteredFoodMap[foodIndex].value;             
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/recipeDetails');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: context.theme.highlightColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                      child:Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            foodDetails[1],  
                                            width: 130,
                                            height: 130,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 15,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      foodDetails[0],  
                                                      style: TextStyle(fontSize: 16, color: context.theme.cardColor),
                                                    ),
                                                    SizedBox(width: 20),
                                                    Text(
                                                      foodDetails[2],  
                                                      style: TextStyle(fontSize: 16, color: context.theme.cardColor),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  foodName, 
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'FontMain'                                                
                                                  ),
                                                ),
                                                SizedBox(height: 2),
                                                Expanded(
                                                  child: Text(
                                                    foodDetails[3],  
                                                    overflow: TextOverflow.ellipsis,  
                                                    softWrap: true, 
                                                    maxLines: 2, 
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: context.theme.splashColor
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],                      
            ),
          ),
        
      ),
      bottomNavigationBar: BottomNav(
        pages: pages,
        selectedInd: 1,
      ),
    );
  }

  Map<String, List<String>> _getFoodMap(String category) {
    switch (category) {
      case "Recommended":
        return recomFoods;
      case "Breakfast":
        return breakfastFoods;
      case "Lunch":
        return lunchFoods;
      case "Appetizer":
        return appetizerFoods;
      case "Dinner":
        return dinnerFoods;
      default:
        return {};
    }
  }
}
