import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../_design_system/consts/app_images_const.dart';
import '../../../../../_design_system/consts/app_logos_const.dart';
import '../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../_design_system/widgets/cards/custom_card_gradient_widget.dart';
import '../../../../../core/shared/routers/routers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(AppLogosConst.logoMuvver),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 10),
            child: Card(
              elevation: 3,
              child: Container(
                width: 40,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://post-phinf.pstatic.net/MjAxOTAxMTJfODEg/MDAxNTQ3MjYwODI2NzMx.5oHnozUoLlmDbckUFAGRQDYhN8RjZeO03fY4Nhx8Jv0g.s_YU6s0R5mKgw3oGf8xX3B7vNJEsq8oxvBknsLQwfjYg.JPEG/azamat-zhanisov-1281197-unsplash.jpg?type=w1200"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 15, top: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            RichText(
              text: TextSpan(
                style: TextStylesConst.titilliumWeb20RegularGray,
                children: <TextSpan>[
                  const TextSpan(text: 'Facilitando seus'),
                  TextSpan(
                    text: ' envios.',
                    style: TextStylesConst.titilliumWeb20BoldGray,
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Entregue ou envie.',
              style: TextStylesConst.titilliumWeb16RegularGray6,
            ),
            const Spacer(),
            CustomCardGradientWidget(
              onTap: () {},
              title: 'Remetente',
              subtitle: 'Pra onde quer enviar seu objeto?',
              image: AppImagesConst.box,
            ),
            const SizedBox(height: 24),
            CustomCardGradientWidget(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  Routers.generateRoutes(
                    const RouteSettings(
                      arguments: null,
                      name: '/traveler',
                    ),
                  ),
                );
              },
              title: 'Viajante',
              subtitle: 'Vai viajar pra onde?',
              image: AppImagesConst.deliveryTruck,
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
