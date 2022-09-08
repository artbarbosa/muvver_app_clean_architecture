import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../text_styles/text_styles_const.dart';

class CustomListTileWidget extends StatefulWidget {
  const CustomListTileWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.trailing,
  }) : super(key: key);

  final String title;
  final String icon;
  final Widget trailing;

  @override
  State<CustomListTileWidget> createState() => _CustomListTileWidgetState();
}

class _CustomListTileWidgetState extends State<CustomListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        widget.title,
        style: TextStylesConst.titilliumWeb12BoldGray,
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
