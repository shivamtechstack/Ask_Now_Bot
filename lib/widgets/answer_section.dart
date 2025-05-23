import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../services/chat_web_service.dart';
import '../theme/colors.dart';

class AnswerSection extends StatefulWidget{
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  String fullData = '';

  @override
  void initState(){
    super.initState();
    ChatWebService().contentStream.listen((data){
      setState(() {
        fullData += data['data'] ?? '';
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('perplexity',
        style: TextStyle(fontSize: 18,color: AppColors.whiteColor),),
        SizedBox(height: 10,),
        Markdown(data: fullData, shrinkWrap: true,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(color: AppColors.whiteColor),       // normal paragraph text
            h1: TextStyle(color: AppColors.whiteColor),
            h2: TextStyle(color: AppColors.whiteColor),
            h3: TextStyle(color: AppColors.whiteColor),
            strong: TextStyle(color: AppColors.whiteColor),   // bold
            em: TextStyle(color: AppColors.whiteColor),       // italic
            blockquote: TextStyle(color: AppColors.whiteColor),
            code: TextStyle(color: AppColors.whiteColor, backgroundColor: AppColors.searchBar),
          ),),
      ],
    );
  }
}