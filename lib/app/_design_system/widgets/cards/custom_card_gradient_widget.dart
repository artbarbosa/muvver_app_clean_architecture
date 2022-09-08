import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../text_styles/text_styles_const.dart';

class CustomCardGradientWidget extends StatelessWidget {
  const CustomCardGradientWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: AspectRatio(
          aspectRatio: 164 / 64.5,
          child: Container(
            padding: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xff353740), Color(0xff222222)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 44, right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStylesConst.titilliumWeb20SemiBoldWhite,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subtitle,
                          style: TextStylesConst.titilliumWeb14RegularWhite,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(image),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
