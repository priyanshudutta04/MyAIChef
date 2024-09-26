import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ai_chef/utils/bottom_pages_list.dart';
import 'package:my_ai_chef/widgets/bottom_nav.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("Coming Soon"))
      ),
      bottomNavigationBar: BottomNav(
          pages: pages,
          selectedInd: 1,
      ),
    );
  }
}