import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';


class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
    floatingActionButton:  Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.cardColor.withOpacity(0.7),
              spreadRadius: 15,
              blurRadius: 20,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          child: Icon(CupertinoIcons.arrow_right,color: context.theme.focusColor,),
          backgroundColor: context.cardColor,
          shape: CircleBorder(),
        ),
      ),
    ),
        

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/woman_chef.png"),
            fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 50,bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                  child: Text(
                    "Find the perfect recipe everyday",
                    style: TextStyle(fontSize: 32, color: Colors.black,fontFamily: 'FontMain',letterSpacing: 3),
                  ),
                ),      
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                  child: Text(
                    "Power Ev offers remotely reserving a charging slot for your EV in advance, or start a new charging session by scanning the QR code on the connector via our app. EV users will be able to plan their outstation trips in advance without worrying about their EV charging needs. Our app maps the nearest charging stations using AI and books the charging slots automatically by estimating the distance the EV can travel on single charge.",
                    style: TextStyle(
                      fontSize: 14, 
                      color: Color.fromARGB(255, 214, 204, 204),
                      fontFamily: 'FontMain',
                        height: 1.5,
                        wordSpacing: 2.0,
                    ),
                  ),
                ),      
              ),

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Row(children: [
                  Container(
                      height: 20,
                      child: Icon(Icons.circle,size: 10,color: Color.fromARGB(255, 183, 183, 183),),
                  ),
                  const SizedBox(width: 20,),
                  Container(
                      height: 20,
                      child: Image.asset("assets/icons/flash.png"),
                  ),
                  const SizedBox(width: 20,),
                   Container(
                      height: 20,
                      child: Icon(Icons.circle,size: 10,color: Color.fromARGB(255, 183, 183, 183),),
                  ),
                
                
                ],),
              ),
              SizedBox(height: 30,)
              

            ],
          ),
          
        ),
      ),
    );
  }
}