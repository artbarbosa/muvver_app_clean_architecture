import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:muvver_app/app/_design_system/consts/app_images_const.dart';
import 'package:muvver_app/app/_design_system/text_styles/text_styles_const.dart';

import '../../../../../../core/shared/routers/routers.dart';
import '../../controllers/traveler_controller.dart';

class MessageSuccessPage extends StatelessWidget {
  MessageSuccessPage({super.key});
  final controller = GetIt.I.get<TravelerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            const Spacer(),
            SvgPicture.asset(AppImagesConst.send),
            const Spacer(),
            Text(
              'Viagem criada',
              style: TextStylesConst.titilliumWeb32RegularGray,
            ),
            const SizedBox(height: 17),
            Text(
              'Vamos ver os volumes já disponíveis para a sua\nviagem.',
              textAlign: TextAlign.center,
              style: TextStylesConst.titilliumWeb14RegularGray,
            ),
            const SizedBox(height: 29),
            Text(
              'Ao prosseguir, você declara para efeitos legais,\nadministrativos, '
              'jurídicos e demais aplicáveis, a veracidade de\ntodas as informações prestadas '
              'antes, durante e após\nqualquer uma das etapas do app.',
              textAlign: TextAlign.center,
              style: TextStylesConst.titilliumWeb12RegularGray32,
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              child: Material(
                color: const Color(0xFF16A45C),
                elevation: 5,
                shadowColor: const Color(0xff222222),
                child: InkWell(
                  onTap: () {
                    controller.reset();
                    Navigator.pushReplacement(
                      context,
                      Routers.generateRoutes(
                        const RouteSettings(
                          arguments: null,
                          name: '/',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      'Visualizar volumes',
                      style: TextStylesConst.titilliumWeb16BoldWhite,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
