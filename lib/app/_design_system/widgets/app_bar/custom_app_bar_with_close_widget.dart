import 'package:flutter/material.dart';

import '../../consts/app_colors_const.dart';
import '../../text_styles/text_styles_const.dart';

class CustomAppBarWithCloseWidget extends StatelessWidget {
  const CustomAppBarWithCloseWidget({
    super.key,
    this.onClose,
    required this.title,
    required this.subtitle,
  });
  final void Function()? onClose;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 3,
      child: Container(
        height: 151,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: onClose,
                    child: const Icon(Icons.close, color: Colors.white)),
                Text(
                  subtitle,
                  style: TextStylesConst.titilliumWeb16RegularWhiteWithOpacity,
                ),
                const Icon(
                  Icons.close,
                  color: Colors.transparent,
                )
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: TextStylesConst.titilliumWeb20RegularWhite,
            ),
          ],
        ),
      ),
    );
  }
}
