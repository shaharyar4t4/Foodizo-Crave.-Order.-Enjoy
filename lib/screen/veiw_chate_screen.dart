import 'package:Foodizo/util/cont_color.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class VeiwChateScreen extends StatefulWidget {
  const VeiwChateScreen({super.key});

  @override
  State<VeiwChateScreen> createState() => _VeiwChateScreenState();
}

class _VeiwChateScreenState extends State<VeiwChateScreen> {
  final Gemini gemini = Gemini.instance;
  final ChatUser _currentUser = ChatUser(id: '0', firstName: 'Shaharyar');
  final ChatUser _gemUser = ChatUser(
    id: '1',
    firstName: 'Chef Confused',
    profileImage: "assets/images/chat.png",
  );
  List<ChatMessage> messages = <ChatMessage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: Image.asset("assets/images/pattern.png").image,
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xAEFFD7D7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: sttext),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
        currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: sbtn,
          containerColor: Color.fromARGB(227, 241, 241, 241),
          currentUserTextColor: Colors.white,
          textColor: Colors.black,
        ),
        onSend: _sendMessage,
        messages: messages);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;

      List<Content> contentList = [
        Content(
          role: 'user',
          parts: [TextPart(question)],
        ),
      ];

      gemini.streamChat(contentList).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;

        // Extract response properly
        String response = event.content?.parts?.map((part) {
              if (part is TextPart) {
                return part.text;
              } else {
                return ''; // Ignore non-text parts
              }
            }).join('') ??
            '';

        if (lastMessage != null && lastMessage.user == _gemUser) {
          lastMessage = messages.removeAt(0);
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          ChatMessage message = ChatMessage(
            user: _gemUser,
            createdAt: DateTime.now(),
            text: response,
          );

          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

// three dots means its spread operator "allows you to expand an iterable"
