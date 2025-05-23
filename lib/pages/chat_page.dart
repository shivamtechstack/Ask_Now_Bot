import 'package:ask_now_bot/theme/colors.dart';
import 'package:ask_now_bot/widgets/answer_section.dart';
import 'package:ask_now_bot/widgets/side_bar.dart';
import 'package:ask_now_bot/widgets/sources_section.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  final String question;
  const ChatPage({super.key, required this.question});

  @override
  State<ChatPage> createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          const SizedBox(width: 100,),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(widget.question, style: TextStyle(fontSize: 20, color: AppColors.whiteColor),),
                    SizedBox(height: 20,),
                    SourcesSection(),
                    SizedBox(height: 20,),
                    AnswerSection()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}