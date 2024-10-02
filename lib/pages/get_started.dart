import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ai_chef/widgets/circle_painter.dart';
import 'package:velocity_x/velocity_x.dart';


class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
    backgroundColor: context.theme.canvasColor,

      body: Stack(
        children: [
          Positioned.fill(
              child: CustomPaint(
                painter: ScatteredBallsPainter(),
              ),
            ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Center(
                      child: Image.asset(
                        width: 350,
                        height: 350,
                        "assets/images/get_started.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Spacer(),
                                    
                     const Center(
                       child: Text(
                          "Create the perfect",
                          style: TextStyle(fontSize: 34,fontFamily: 'FontMain',letterSpacing: 2),
                        ),
                     ),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "recipe ",
                                style: TextStyle(
                                  fontSize: 34,
                                  fontFamily: 'FontMain',
                                  letterSpacing: 3,
                                  color: Colors.black, 
                                ),
                              ),
                              TextSpan(
                                text: "everyday",
                                style: TextStyle(
                                  fontSize: 34,
                                  fontFamily: 'FontMain',
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                  color: context.theme.cardColor, 
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                           
                
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Let our AI chef turn your ingredients into gourmet creations.",
                          style: TextStyle(
                            fontSize: 16, 
                            color: context.theme.splashColor,
                            fontFamily: 'FontMain',
                              height: 1.5,
                              wordSpacing: 2.0,
                          ),
                        ),
                      ),      
                    ),
                
                    const SizedBox(height: 10,),
                
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: double.infinity,
                          height:60,
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Center(child: Text("Get Started",
                            style: TextStyle(color: context.theme.canvasColor,fontSize: 20),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
              
            ),
        ],
      ),
      );
    
  }
}


