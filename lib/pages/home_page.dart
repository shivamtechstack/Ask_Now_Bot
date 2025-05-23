import 'package:ask_now_bot/widgets/search_section.dart';
import 'package:ask_now_bot/widgets/side_bar.dart';
import 'package:flutter/material.dart';

import '../services/chat_web_service.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullResponse = '';

  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(
              children: [
                Expanded(child: SearchSection()),
                StreamBuilder(stream: ChatWebService().contentStream, builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  fullResponse += snapshot.data?['data'] ?? '';
                  return Text(fullResponse);
                }),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Wrap(
                    children: [

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}