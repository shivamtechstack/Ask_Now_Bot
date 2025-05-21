import 'package:ask_now_bot/theme/colors.dart';
import 'package:flutter/material.dart';

class SearchBarButton extends StatefulWidget{
  final IconData icon;
  final String text;
  const SearchBarButton({super.key, required this.icon, required this.text});

  @override
  State<StatefulWidget> createState() => _SearchBarButtonState();

}

class _SearchBarButtonState extends State<SearchBarButton>{
  bool isHover = false;

  @override
  Widget build(BuildContext context) {


   return MouseRegion(
     onEnter: (event) => setState(() => isHover = true),
     onExit: (event) => setState(() => isHover = false),
     child: Container(
       padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(6),
         color: isHover ? AppColors.proButton : Colors.transparent
       ),
       child: Row(
         children: [
           Icon(widget.icon, color: AppColors.iconGrey, size: 20,),
           const SizedBox(width: 7,),
           Text(widget.text, style: TextStyle(color: AppColors.textGrey),)
         ],
       ),
     ),
   );
  }
}