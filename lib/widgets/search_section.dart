import 'package:ask_now_bot/pages/chat_page.dart';
import 'package:ask_now_bot/services/chat_web_service.dart';
import 'package:ask_now_bot/theme/colors.dart';
import 'package:ask_now_bot/widgets/search_bar_button.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget{
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    queryController.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Text('Where knowledge begins', style: TextStyle(color: AppColors.whiteColor)),
       const SizedBox(height: 10,),
       Container(
         width: 700,
         decoration: BoxDecoration(
           color: AppColors.searchBar,
           borderRadius: BorderRadius.circular(10),
           border: Border.all(color: AppColors.searchBarBorder)
         ),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(14.0),
               child: TextField(
                 controller: queryController,
                 style: TextStyle(color: AppColors.whiteColor),
                 decoration: InputDecoration(
                   hintText: 'Search anything...',
                   hintStyle: TextStyle(color: AppColors.textGrey),
                   border: InputBorder.none,

                   isDense: true,
                   contentPadding: EdgeInsets.zero,
                 ),

               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   SearchBarButton(icon: Icons.auto_awesome_outlined, text: 'Focus',),
                   const SizedBox(width: 10,),
                   SearchBarButton(icon: Icons.add_circle_outline, text: 'Attach',),
                   const Spacer(),
                   GestureDetector(
                     onTap: (){
                       ChatWebService().chat(queryController.text.trim());
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage(question: queryController.text.trim())));
                     },
                     child: Container(
                       padding: EdgeInsets.all(9),
                       decoration: BoxDecoration(
                         color: AppColors.submitButton,
                         borderRadius: BorderRadius.circular(40)
                       ),
                       child: const Icon(Icons.arrow_forward_ios, color: AppColors.background,size: 16,),
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
       )
     ],
   );
  }
}