import 'package:ask_now_bot/widgets/search_section.dart';
import 'package:ask_now_bot/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

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