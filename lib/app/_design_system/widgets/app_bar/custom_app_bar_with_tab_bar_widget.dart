import 'package:flutter/material.dart';

import '../../consts/app_colors_const.dart';
import '../../text_styles/text_styles_const.dart';

class CustomAppBarWithTabBarWidget extends StatelessWidget {
  const CustomAppBarWithTabBarWidget({
    Key? key,
    required this.onBack,
    required this.onCancel,
    required this.title,
    required this.subtitle,
    required this.tabs,
  }) : super(key: key);
  final void Function()? onBack;
  final void Function()? onCancel;
  final String title;
  final String subtitle;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 3,
      child: Container(
        height: 151,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [ColorsConst.lightGray, ColorsConst.gray],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 10, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: onBack,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Spacer(),
                  Text(
                    subtitle,
                    style:
                        TextStylesConst.titilliumWeb16RegularWhiteWithOpacity,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: onCancel,
                    child: Text(
                      'Cancelar',
                      style: TextStylesConst.titilliumWeb14BoldWhite,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Text(
                title,
                style: TextStylesConst.titilliumWeb20RegularWhite,
              ),
            ),
            const Spacer(),
            TabBar(
              indicatorColor: Colors.white,
              tabs: tabs,
            ),
          ],
        ),
      ),
    );
  }
}
