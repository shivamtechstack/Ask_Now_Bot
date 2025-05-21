import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SideBarButton extends StatelessWidget{
  final bool isCollapsed;
  final IconData icon;
  final String text;

  const SideBarButton({super.key, required this.isCollapsed, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
   return Row(
     mainAxisAlignment : isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start ,
     children: [
       Container(
         margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
         child: Icon(icon,
             color: AppColors.iconGrey,
             size: 22),
       ),
       isCollapsed ? Container() : Text(text,
         style: TextStyle(
           fontSize: 16,
           color: AppColors.whiteColor,
           fontWeight: FontWeight.bold,
         ),
       )
     ],
   );
  }

}