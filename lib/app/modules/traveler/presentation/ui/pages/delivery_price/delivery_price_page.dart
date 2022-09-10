import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../_design_system/consts/app_colors_const.dart';
import '../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../_design_system/widgets/app_bar/custom_app_bar_with_arrow_and_cancel_widget.dart';
import '../../../../../../core/shared/routers/routers.dart';
import '../../controllers/traveler_controller.dart';

class DeliveryPricePage extends StatelessWidget {
  DeliveryPricePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<TravelerController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBarWithArrowAndCancelBarWidget(
                    title: 'Definir preço mínimo do deslocamento?',
                    subtitle: 'Ser um Muvver',
                    onBack: () {
                      Navigator.of(context).pop();
                    },
                    onCancel: () {
                      Navigator.pushReplacement(
                        context,
                        Routers.generateRoutes(
                          const RouteSettings(
                            arguments: null,
                            name: '/',
                          ),
                        ),
                      );
                      controller.reset();
                    },
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 1),
                    child: Text(
                      'Preço de entrega',
                      style: TextStylesConst.titilliumWeb16BoldGray,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Valor sugerido',
                      style: TextStylesConst.titilliumWeb12RegularGray8,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller.price,
                    builder: (_, __) {
                      return Column(
                        children: [
                          Slider(
                            value: controller.price.value,
                            divisions: 200,
                            onChanged: (value) {
                              controller.setDeliveryPrice(value);
                            },
                            min: 0,
                            max: 200,
                            thumbColor: ColorsConst.gray,
                            activeColor: ColorsConst.gray,
                            inactiveColor: ColorsConst.gray12,
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: 70,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              textAlign: TextAlign.center,
                              controller: controller.priceTextController,
                              keyboardType: TextInputType.number,
                              cursorColor: ColorsConst.gray,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'asd';
                                }
                                var valueDouble = double.tryParse(value);
                                if (valueDouble != null) return null;
                              },
                              decoration: InputDecoration(
                                prefixStyle:
                                    TextStylesConst.titilliumWeb14RegularGray,
                                labelStyle:
                                    TextStylesConst.titilliumWeb14RegularGray,
                                prefixText: 'R\$',
                                focusColor: ColorsConst.gray,
                                enabledBorder: const UnderlineInputBorder(),
                                focusedBorder: const UnderlineInputBorder(),
                                disabledBorder: const UnderlineInputBorder(),
                              ),
                              style: TextStylesConst.titilliumWeb14RegularGray,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Clique no valor acima, para um preço mais específico',
                            style: TextStylesConst.titilliumWeb12RegularGray32,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  child: Material(
                    color: const Color(0xFF16A45C),
                    elevation: 5,
                    shadowColor: const Color(0xff222222),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState != null) {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, '/message');
                            controller.setTravelerEntity();
                            controller.addTraverler();
                          }
                        }
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
          )
        ],
      ),
    );
  }
}
