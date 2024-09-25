import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:my_ai_chef/widgets/charger_card.dart';
import 'package:my_ai_chef/widgets/pulsating_gradient.dart';
import 'package:shimmer/shimmer.dart';


import 'package:velocity_x/velocity_x.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,   
      appBar: AppBar(
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
                                        
                              Image.asset(
                              width: 100,
                              height: 150,
                              "assets/images/woman_chef.png",
                              fit: BoxFit.cover,
                            ),
                              
                            ],
                          ),
                        ],
                      ),
                    
                  ),
                

              ],
            ),
          ),
        )
      ),
    );
  }
}


class SparklingAnimation extends StatefulWidget {
  final Widget child;

  const SparklingAnimation({required this.child});

  @override
  _SparklingAnimationState createState() => _SparklingAnimationState();
}

class _SparklingAnimationState extends State<SparklingAnimation> with SingleTickerProviderStateMixin {
  final Random random = Random();
  final List<List<Offset>> _sparkleTrails = []; // Stores a list of previous positions for each star
  final List<double> _sparkleOpacities = [];
  final List<Offset> _velocity = [];
  late AnimationController _controller;

  final double maxSpeed = 0.3;  // Slow down the movement
  final int trailLength = 10; // Number of trail positions to store for each star

  @override
  void initState() {
    super.initState();

    // Initialize stars with trails
    for (int i = 0; i < 10; i++) {
      // Initialize each star's trail with its starting position
      List<Offset> initialTrail = List.generate(
        trailLength,
        (_) => Offset(random.nextDouble() * 200, random.nextDouble() * 200),
      );

      _sparkleTrails.add(initialTrail);
      _sparkleOpacities.add(random.nextDouble() * 0.5 + 0.5);

      _velocity.add(Offset(
        random.nextDouble() * maxSpeed * 2 - maxSpeed,
        random.nextDouble() * maxSpeed * 2 - maxSpeed,
      ));
    }

    _controller = AnimationController(
      duration: const Duration(milliseconds: 16),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      for (int i = 0; i < _sparkleTrails.length; i++) {
        // Update the trail by removing the oldest position and adding the new position
        List<Offset> trail = _sparkleTrails[i];

        Offset newPosition = trail.last + _velocity[i];

        // Ensure the new position stays within bounds
        if (newPosition.dx < 0 || newPosition.dx > 200) {
          _velocity[i] = Offset(-_velocity[i].dx, _velocity[i].dy);
        }
        if (newPosition.dy < 0 || newPosition.dy > 200) {
          _velocity[i] = Offset(_velocity[i].dx, -_velocity[i].dy);
        }

        // Add new position at the end and remove the oldest position
        trail.add(newPosition);
        if (trail.length > trailLength) {
          trail.removeAt(0);
        }

        _sparkleTrails[i] = trail;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(  // This restricts the drawing area of CustomPaint
      child: Stack(
        children: [
          widget.child,
          Positioned.fill(
            child: CustomPaint(
              painter: SparklingPainter(
                sparkleTrails: _sparkleTrails,
                sparkleOpacities: _sparkleOpacities,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SparklingPainter extends CustomPainter {
  final List<List<Offset>> sparkleTrails;
  final List<double> sparkleOpacities;

  SparklingPainter({
    required this.sparkleTrails,
    required this.sparkleOpacities,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int i = 0; i < sparkleTrails.length; i++) {
      final List<Offset> trail = sparkleTrails[i];
      final double opacity = sparkleOpacities[i];

      // Draw the trail, fading out with each previous position
      for (int j = 0; j < trail.length - 1; j++) {
        final Offset start = trail[j];
        final Offset end = trail[j + 1];

        // Create a fading effect by decreasing opacity for older positions
        paint.color = Colors.white.withOpacity(opacity * (j + 1) / trail.length);

        // Draw a line segment for the trail
        canvas.drawLine(start, end, paint);
      }

      // Draw the current star (last position in the trail)
      paint.color = Colors.white.withOpacity(opacity);
      drawStar(canvas, trail.last.dx, trail.last.dy, paint);
    }
  }

  void drawStar(Canvas canvas, double x, double y, Paint paint) {
    final path = Path();
    const double radius = 5.0;
    path.moveTo(x, y - radius);
    for (int i = 1; i <= 5; i++) {
      path.lineTo(
        x + radius * cos((i * 2 * pi) / 5),
        y - radius * sin((i * 2 * pi) / 5),
      );
      path.lineTo(
        x + (radius / 2) * cos(((i * 2 + 1) * pi) / 5),
        y - (radius / 2) * sin(((i * 2 + 1) * pi) / 5));
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


