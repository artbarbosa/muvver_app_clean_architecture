import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muvver_app/app/_design_system/consts/app_images_const.dart';
import 'package:muvver_app/app/_design_system/widgets/text_form_field/custom_text_form_field_widget.dart';

import '../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../_design_system/widgets/app_bar/custom_app_bar_with_close_widget.dart';

class MidPointPage extends StatefulWidget {
  const MidPointPage({super.key});

  @override
  _MidPointPageState createState() => _MidPointPageState();
}

class _MidPointPageState extends State<MidPointPage> {
  final TextEditingController _dataControllerMidPoint =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarWithCloseWidget(
                  height: 80,
                  title: '',
                  subtitle: '',
                  onClose: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Ponto intermediário',
                    style: TextStylesConst.titilliumWeb16BoldGray,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                      style: TextStylesConst.titilliumWeb16RegularGray32,
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Insira os pontos intermediários na '),
                        TextSpan(
                          text: 'sequência exata',
                          style: TextStylesConst.titilliumWeb16BoldGray,
                        ),
                        TextSpan(
                          text: ' em que você passará por eles',
                          style: TextStylesConst.titilliumWeb16RegularGray32,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextFormFieldWidget(
                    labelText: 'Nome da cidade',
                    textEditingController: _dataControllerMidPoint,
                    textInputAction: TextInputAction.next,
                    hintText: 'Nome da cidade',
                    readOnly: false,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Usuários que viajam de campo Grande - MS para Dourados - MS também passam por:',
                    style: TextStylesConst.titilliumWeb14BoldGray,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImagesConst.mapPointer,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Rio Brilhante - MS',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'TitilliumWeb',
                                color: Color(0xFF222222),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(3)),
                child: Material(
                  color: const Color(0xFF16A45C),
                  elevation: 5,
                  shadowColor: const Color(0xff222222),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/options_trip');
                    },
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        'Avançar',
                        style: TextStylesConst.titilliumWeb16BoldWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
