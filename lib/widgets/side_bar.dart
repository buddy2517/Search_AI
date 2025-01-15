import 'package:flutter/material.dart';
import 'package:search_ai/theme/colors.dart';
import 'package:search_ai/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool iscollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: iscollapsed ? 64.0 : 128.0,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: iscollapsed ? 30 : 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: iscollapsed
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                SideBarButton(
                    iscollapsed: iscollapsed, icon: Icons.add, text: "Home"),
                SideBarButton(
                    iscollapsed: iscollapsed,
                    icon: Icons.search,
                    text: "Search"),
                SideBarButton(
                    iscollapsed: iscollapsed,
                    icon: Icons.language,
                    text: "Spaces"),
                SideBarButton(
                    iscollapsed: iscollapsed,
                    icon: Icons.auto_awesome,
                    text: "Discover"),
                SideBarButton(
                    iscollapsed: iscollapsed,
                    icon: Icons.cloud_outlined,
                    text: "Library"),
                const Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                iscollapsed = !iscollapsed;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Icon(
                iscollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
