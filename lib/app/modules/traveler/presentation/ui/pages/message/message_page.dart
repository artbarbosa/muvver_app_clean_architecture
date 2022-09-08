import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muvver_app/app/_design_system/consts/app_images_const.dart';

import '../../../../../../core/shared/routers/routers.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            AppImagesConst.send,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              'Viagem criada',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'TitilliumWeb',
                color: Color(0xFF222222),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 17),
            child: Text(
              'Vamos ver os volumes já disponíveis para a sua\nviagem.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'TitilliumWeb',
                color: Color(0xFF222222),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 29, bottom: 56),
            child: Text(
              'Ao prosseguir, você declara para efeitos legais,\nadministrativos, '
              'jurídicos e demais aplicáveis, a veracidade de\ntodas as informações prestadas '
              'antes, durante e após\nqualquer uma das etapas do app.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'TitilliumWeb',
                color: Color(0xFF222222),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                child: Material(
                  color: const Color(0xFF16A45C),
                  elevation: 5,
                  shadowColor: const Color(0xff222222),
                  child: InkWell(
                    onTap: () {
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
                      child: const Text('Visualizar volumes',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'TitilliumWeb',
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
