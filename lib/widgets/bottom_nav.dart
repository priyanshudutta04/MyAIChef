import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.pages,
    required this.selectedInd,
  });

  final List<StatefulWidget> pages;
  final int selectedInd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: context.theme.canvasColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        child: GNav(
            selectedIndex: selectedInd,
            onTabChange: (index) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      pages[index],
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            backgroundColor:  context.theme.canvasColor,
            color: context.theme.splashColor,
            activeColor: context.theme.cardColor,
            tabBackgroundColor: context.theme.highlightColor,
            padding: EdgeInsets.all(10),
            gap: 10,
            rippleColor: context.theme.cardColor,
            tabs: [         
              GButton(
                icon: FontAwesomeIcons.house,
                text: 'Home',
                iconSize: 19,
                textSize: 16,
              ),
              GButton(
                icon: FontAwesomeIcons.bowlFood,
                text: 'Recipes',
                iconSize: 19,
                textSize: 16,
              ),
               GButton(
                icon: FontAwesomeIcons.newspaper,
                text: 'Blogs',
                iconSize: 19,
                textSize: 16,
              ),
              GButton(
                icon: FontAwesomeIcons.user,
                text: 'Profile',
                iconSize: 19,
                textSize: 16,
              ),
            ]),
      ),
    );
  }
}
