import 'package:flutter/material.dart';

import '../services/chat_web_service.dart';
import '../theme/colors.dart';

class SourcesSection extends StatefulWidget{
  const SourcesSection({super.key});
  @override
  State<SourcesSection> createState() => _SourcesSectionState();

}
class _SourcesSectionState extends State<SourcesSection>{
  List<Map<String, dynamic>> searchResults = [];

  @override
  void initState(){
    super.initState();
    ChatWebService().searchResultStream.listen((data){
      setState(() {
        searchResults = data['data'];
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.source_outlined, color: AppColors.whiteColor,),
            SizedBox(width: 8,),
            Text("sources",style: TextStyle(color: AppColors.whiteColor),)
          ],
        ),
        SizedBox(height: 16,),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: searchResults.map((res) {
            return Container(
            width:150,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.searchBar,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.searchBarBorder)
            ),
            child: Column(
              children: [
                Text(res['title'], style: TextStyle(color: AppColors.whiteColor),maxLines:2, overflow: TextOverflow.ellipsis,),
        const SizedBox(height: 10,),
        Text(res['url'], style: TextStyle(color: AppColors.whiteColor),maxLines:2, overflow: TextOverflow.ellipsis,)
            ]
            )
            );
          }).toList(),
        )
      ],
    );
  }

}