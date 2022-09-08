import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../text_styles/text_styles_const.dart';

class CustomListTileWithSubtitleWidget extends StatefulWidget {
  const CustomListTileWithSubtitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.trailing,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String icon;
  final Widget trailing;

  @override
  State<CustomListTileWithSubtitleWidget> createState() =>
      _CustomListTileWithSubtitleWidgetState();
}

class _CustomListTileWithSubtitleWidgetState
    extends State<CustomListTileWithSubtitleWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        widget.title,
        style: TextStylesConst.titilliumWeb12BoldGray,
      ),
      subtitle: Text(
        widget.subtitle,
        style: TextStylesConst.titilliumWeb12RegularGray8,
      ),
      leading: SvgPicture.asset(
        widget.icon,
        height: 32,
        width: 32,
      ),
      trailing: widget.trailing,
    );
  }
}
