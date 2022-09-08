import 'package:flutter/material.dart';
import 'package:muvver_app/app/_design_system/consts/app_colors_const.dart';
import 'package:muvver_app/app/_design_system/text_styles/text_styles_const.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function(int)? onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStylesConst.titilliumWeb10RegularGray14,
      unselectedLabelStyle: TextStylesConst.titilliumWeb10RegularGray14,
      selectedItemColor: ColorsConst.gray14,
      unselectedItemColor: ColorsConst.gray14,
      currentIndex: widget.currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: widget.onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: ColorsConst.gray14,
            size: 28,
          ),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_rounded,
            color: ColorsConst.gray14,
            size: 28,
          ),
          label: 'Notificações',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_bubble_rounded,
            color: ColorsConst.gray14,
            size: 28,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.filter_none_rounded,
            color: ColorsConst.gray14,
            size: 28,
          ),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_shipping_rounded,
            color: ColorsConst.gray14,
            size: 28,
          ),
          label: 'Entregas',
        ),
      ],
    );
  }
}
