import 'package:ask_now_bot/theme/colors.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        crossAxisAlignment: isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: 30,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Icon(Icons.add,
                    color: AppColors.iconGrey,
                    size: 22),
              ),
              Text("Home",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(Icons.search,
                color: AppColors.iconGrey,
                size: 22)
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(Icons.language,
                color: AppColors.iconGrey,
                size: 22)
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(
              Icons.auto_awesome,
              color: AppColors.iconGrey,
              size: 22
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(
              Icons.cloud_circle_outlined,
              color: AppColors.iconGrey,
              size: 22
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: (){
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Icon(
                isCollapsed ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 22
              ),
            ),
          ),
        ],
      ),
    );
  }
}
