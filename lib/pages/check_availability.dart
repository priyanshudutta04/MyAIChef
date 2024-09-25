import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckAvailability extends StatefulWidget {
  const CheckAvailability({super.key});

  @override
  State<CheckAvailability> createState() => _CheckAvailabilityState();
}

class _CheckAvailabilityState extends State<CheckAvailability> {

  TimeOfDay? startTime;
  TimeOfDay? endTime;
  int difference=0;

  void _selectStartTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        startTime = selectedTime;
      });
    }
  }

  void _selectEndTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        endTime = selectedTime;
      });
    }
    _calculateDifference();
  }

  void _calculateDifference() {
    if (startTime != null && endTime != null) {
      final int startMinutes = startTime!.hour * 60 + startTime!.minute;
      final int endMinutes = endTime!.hour * 60 + endTime!.minute;

      difference = endMinutes - startMinutes;

    }
  }

  @override
  Widget build(BuildContext context) {
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
                    "Check Availabilty",
                    style: TextStyle(fontSize: 32, color: Colors.white,fontFamily: 'Anta',letterSpacing: 3),
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
                    "Check if the slot is already prebooked or not",
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
              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      GestureDetector(
                      onTap: _selectStartTime,
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white10,Colors.white10]
                          ),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 2,color: context.theme.focusColor),
                        ),
                        padding: EdgeInsets.all(16.0),
                        
                        child: startTime != null
                            ? Text(
                                'From: ${startTime!.format(context)}',
                                style: TextStyle(color: Colors.white),
                              )
                            : Text(
                                'From:',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: _selectEndTime,
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white10,Colors.white10]
                          ),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 2,color: context.theme.cardColor),
                        ),
                        child: endTime != null
                            ? Text(
                                'To: ${endTime!.format(context)}',
                                style: TextStyle(color: Colors.white),
                              )
                            : Text(
                                'To:',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 50,),

              difference<1? Text('Slot Available!',style: TextStyle(fontSize: 32, color: context.canvasColor,),)
              :Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Slot Available!',
                  style: TextStyle(fontSize: 32, color: context.theme.cardColor,fontFamily: 'Anta'),
                ),
              ),

              const SizedBox(height: 50,),

              difference<1? Container()
              :GestureDetector(
                onTap: () => {
                      Navigator.pushNamed(context, '/payment',arguments: difference,)
                      
                  },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 30, top: 10,bottom: 10),
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
                          "Book Now",
                          style: TextStyle(fontFamily: 'FontMain',fontSize: 18,color: context.theme.splashColor,fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),


              

           

          ],
        ),
      ),
    );
  }
}