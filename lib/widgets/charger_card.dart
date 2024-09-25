import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChargerCard extends StatelessWidget {
  final String name;
  final String image;
  final String address;
  final String ports;
  ChargerCard({super.key, required this.name, required this.image, required this.address, required this.ports});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            // color: context.theme.splashColor,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    child: Image.asset(image, fit: BoxFit.cover),
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(width: 10), 
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      Text(name,style: TextStyle(fontFamily: 'FontMain',color: context.theme.focusColor,fontSize: 18),),
                      SizedBox(height: 5), 
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:5.0),
                            child: Container(
                                height: 15,
                                child: Image.asset("assets/icons/location.png"),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: Text(
                              address,
                              softWrap: true,
                              style: TextStyle(fontFamily: 'FontMain',color: context.theme.focusColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8), 
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(ports,style: TextStyle(fontFamily: 'FontMain',color: context.theme.cardColor,fontSize: 12),),
                      ),  
                    ],
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}