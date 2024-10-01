import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_ai_chef/utils/food_list.dart';
import 'package:velocity_x/velocity_x.dart';

class FindRecipe extends StatefulWidget {
  const FindRecipe({super.key});

  @override
  State<FindRecipe> createState() => _FindRecipeState();
}

class _FindRecipeState extends State<FindRecipe> {
  int count=0;
  final List<Map<String, String>> _messages = [];
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
    'Great!, now I need to know if you have any of the following food allergies?'
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

    
    _sendInitialBotMessage(_predefinedBotMessages[count++]);
  }

  void _streamBotMessage(String message) {
    List<String> words = message.split(' ');
    String accumulatedMessage = '';
    int index = 0;

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
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

  @override
  void initState() {
    _sendInitialBotMessage(_predefinedBotMessages[count++]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title: const Text('Smart AI Chef'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final isUser = _messages[index]['sender'] == 'user';
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
                          child: ConstrainedBox(
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
                                  Text(
                                    _messages[index]['message']!,
                                    style: TextStyle(
                                        color: isUser
                                            ? context.theme.highlightColor
                                            : Colors.black),
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
            :Container(),
          ],
        ),
      ),
    );
  }
}
