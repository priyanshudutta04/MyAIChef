import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_ai_chef/pages/recipe_details.dart';
import 'package:my_ai_chef/secret.dart';
import 'package:my_ai_chef/widgets/grid_painter.dart';
import 'package:velocity_x/velocity_x.dart';

class FindRecipe extends StatefulWidget {
  const FindRecipe({super.key});

  @override
  State<FindRecipe> createState() => _FindRecipeState();
}

class _FindRecipeState extends State<FindRecipe> {
  int count=0;
  File? _selectedImage;
  bool imgup=false;
  bool suggest=false;
  
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final List<String> _dietarypref = [
    'Non-Vegetarian',
    'Vegetarian',
    'Ketogenic'
  ];

  final List<String> _foodallergy= [
    'None',
    'Nuts',
    'Eggs'
  ];

  final List<String> _predefinedBotMessages = [
    'Hi, I am your AiChef, I am here to help you find the perfect recipe for you based on your available ingredients. But first, I need to know what are your dietary preferences?',
    'Great!, now I need to know if you have any of the following food allergies?',
    'Ok, Now please upload image of the ingridients that are available with you right now',
    'Analyzing your Ingridients...',
  ];

  
  void _sendInitialBotMessage(String message) {
    Timer(const Duration(seconds: 0), () {
      _streamBotMessage(message);
    });

  }

  void _sendMessage(String message) {
    setState(() {
      _messages.add({'sender': 'user', 'message': message}); 
    });
    if(imgup==false){
       _sendInitialBotMessage(_predefinedBotMessages[count++]);
    
    } 
    else{
      _sendInitialBotMessage("Analyzing input image");
    }
  }

  void _streamBotMessage(String message) {
    List<String> words = message.split(' ');
    String accumulatedMessage = '';
    int index = 0;

    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (index < words.length) {
        setState(() {
          accumulatedMessage += (index == 0 ? '' : ' ') + words[index];
          if (_messages.isNotEmpty && _messages.last['sender'] == 'bot') {
            _messages.last['message'] = accumulatedMessage;
          } else {
            _messages.add({
              'sender': 'bot',
              'message': accumulatedMessage,
            });
          }
        });
        index++;
      } else {
        timer.cancel(); 
      }
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        _messages.add({
          'sender': 'user',
          'type': 'image',
          'image': _selectedImage,  
        });
      });
    }
    imgup=true;
    _sendGemini("Analyzing gemini image");
  }

  Future<void> _sendGemini(String message) async {

  final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: GEMINI_API_KEY,
  );

    final prompt = 'I am going to send you the image of ingridients, your job is to identify if the ingridients and check if it has chicken and onion. If yes then answer yes else no. Nothing extra';
    final imageBytes = await _selectedImage!.readAsBytes(); 

    final content = [
      Content.text(prompt),
      Content.data('image/jpeg', imageBytes), 
    ];
    final response = await model.generateContent(content);

    if(response.text != null && response.text!.toLowerCase().contains('yes')){
        Timer(const Duration(seconds: 0), () {
        _streamBotMessage('Based on the ingridients, I suggest you to make Chicken Biriyani');
        suggest=true;
      });
    }
    else{
        Timer(const Duration(seconds: 0), () {
        _streamBotMessage("Unable to suggest any recipe");     
      });
    }
  }


  @override
  void initState() {
    _sendInitialBotMessage(_predefinedBotMessages[count++]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
      
      backgroundColor: Colors.transparent,
      
        title:  Text('Smart AI Chef'),
      ),
      body: Stack(
        children: [
           CustomPaint(
            size: Size.infinite, // Take the full available space
            painter: GridPatternPainter(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final isUser = _messages[index]['sender'] == 'user';
                      final isImage = _messages[index]['type'] == 'image';
                      final name = isUser ? 'You' : 'AiChef';
                      final time =
                          DateTime.now().toLocal().toString().substring(11, 16);
          
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment:
                              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                              child:isImage
                              ? Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color:context.theme.cardColor,
                                  borderRadius:const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(0),
                                  )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                          _messages[index]['image'], 
                                          width: 150,  
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                    ),
                                  ],
                                ),
                              )
                              :  ConstrainedBox(
                                  constraints: const BoxConstraints(
                                  maxWidth: 250,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: isUser
                                        ? context.theme.cardColor
                                        : context.theme.highlightColor,
                                    borderRadius: isUser
                                        ? const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(0),
                                          )
                                        : const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(20),
                                          ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          color: isUser
                                              ? context.theme.highlightColor
                                              : context.theme.cardColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      RichText(
                                        text: TextSpan(
                                          children: _highlightKeywords(_messages[index]['message']!,isUser),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              time,
                              style: TextStyle(
                                color: context.theme.splashColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                count==1?
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _dietarypref.map((message) {
                      return GestureDetector(
                        onTap: () => _sendMessage(message),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical:10,horizontal:15),
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            message,
                            style:  TextStyle(color: context.theme.highlightColor),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
                : count == 2 
                ?
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _foodallergy.map((message) {
                      return GestureDetector(
                        onTap: () => _sendMessage(message),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical:10,horizontal:35),
                          decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            message,
                            style:  TextStyle(color: context.theme.highlightColor),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
                : count == 3
                ?GestureDetector(
                  onTap: (){
                    count ++;
                   _pickImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40 ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical:10,horizontal:35),
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload Image",
                            style:  TextStyle(color:context.theme.highlightColor,fontSize: 22),
                          ),
                          SizedBox(width: 10,),
                          Icon(FontAwesomeIcons.camera,color: context.theme.highlightColor,size: 18,)
                        ],
                      ),
                    ),
                  ),
                )
                :count == 4 && suggest==true?GestureDetector(
                  onTap: (){
                   Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeDetails()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40 ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical:10,horizontal:35),
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View Recipe",
                            style:  TextStyle(color:context.theme.highlightColor,fontSize: 22),
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                )
                :Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<TextSpan> _highlightKeywords(String message,bool isUser) {
  List<TextSpan> spans = [];
  List<String> words = message.split(' '); 
  
  for (String word in words) {
    if (word.toLowerCase() == 'biriyani' || word.toLowerCase() == 'chicken') {
      spans.add(TextSpan(
        text: word + ' ', 
        style: TextStyle(color: Color.fromRGBO(251, 147, 0, 1),), 
      ));
    } else {
      spans.add(TextSpan(
        text: word + ' ',
        style: TextStyle(color:isUser
        ? Colors.white
        : const Color.fromARGB(255, 102, 102, 102)),
      ));
    }
  }
  
  return spans;
}