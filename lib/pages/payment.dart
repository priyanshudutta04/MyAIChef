import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int time=0;
  int price=0;
  int totalPrice=0;

  @override
  Widget build(BuildContext context) {
    time = ModalRoute.of(context)?.settings.arguments as int;
    price=time*5;
    totalPrice=price+25;

    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 70,bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: Text(
                  "Payment Details",
                  style: TextStyle(fontSize: 32, color: Colors.white,fontFamily: 'Anta',letterSpacing: 3),
                ),
              ),      
            ),
            Padding(        
              padding: const EdgeInsets.only(top: 50,left: 30,right: 30), 
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                // ignore: sort_child_properties_last
                height: 430,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.canvasColor,
                    border: Border.all(width: 2,color: Colors.white30),
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black,
                          blurRadius: 15,
                          offset: Offset(4, 4),
                          spreadRadius: 5
                      ),
                      BoxShadow(
                          color: Colors.grey.shade800,
                          blurRadius: 15,
                          offset: const Offset(-4, -4),
                          spreadRadius: 5
                      ),
                          
                    ]),
                child: Column(
                  children: [
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Base Cost",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                          Text("₹$price",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Divider(
                          color: context.cardColor,
                          thickness: 1.0,
                          indent: 0.0,
                          endIndent: 0.0,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Discounts",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                          Text("-₹0.0",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Divider(
                          color: context.cardColor,
                          thickness: 1.0,
                          indent: 0.0,
                          endIndent: 0.0,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Convenience Fees",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                          Text("₹20",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Divider(
                          color: context.cardColor,
                          thickness: 1.0,
                          indent: 0.0,
                          endIndent: 0.0,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Service Charges",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                          Text("₹5",style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Divider(
                          color: context.cardColor,
                          thickness: 1.0,
                          indent: 0.0,
                          endIndent: 0.0,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Cost",style: TextStyle(color: context.theme.focusColor,fontSize: 20,fontFamily: 'FontMain'),),
                          Text("₹$totalPrice",style: TextStyle(color: context.theme.focusColor,fontSize: 20,fontFamily: 'FontMain'),),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => {
                              Navigator.pushNamed(context, '/paymentDone')
                          },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0, top: 40,bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 65,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: context.theme.focusColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Complete Payment",
                                  style: TextStyle(fontFamily: 'FontMain',fontSize: 18,color: context.theme.splashColor,fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
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