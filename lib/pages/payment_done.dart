import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       
        body: DingSoundPage(),
      );
    
  }
}

class DingSoundPage extends StatefulWidget {
  @override
  _DingSoundPageState createState() => _DingSoundPageState();
}

class _DingSoundPageState extends State<DingSoundPage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    
    _playDingSound();
  }

  Future<void> _playDingSound() async {  
    String soundPath = "others/apple_pay_sound.mp3"; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    await _audioPlayer.play(AssetSource(soundPath));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 150,
                  child: Lottie.asset(
                    'assets/others/Animation - 1709006193421.json',
                    repeat: false,
                  ),
              ),
              const SizedBox(height: 30,),
              Text(
                "Charging Slot Resreved!",
                style: TextStyle(color: context.theme.focusColor,fontSize: 16,fontFamily: 'FontMain'),
              ),
              Text(
                "Please visit the charging station on time",
                style: TextStyle(color: Color.fromARGB(255, 214, 204, 204),fontSize: 14,fontFamily: 'FontMain'),
              )
            ],
          ),
        ),
      ),
    );
  }
}