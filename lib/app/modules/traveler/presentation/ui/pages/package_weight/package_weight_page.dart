import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../_design_system/widgets/app_bar/custom_app_bar_with_arrow_and_cancel_widget.dart';
import '../../../../../../core/shared/routers/routers.dart';
import '../../../../domain/value_objects/package_weight.dart';
import '../../controllers/traveller_controller.dart';
import 'components/package_weight_options_component.dart';

class PackageWeightPage extends StatefulWidget {
  const PackageWeightPage({super.key});

  @override
  State<PackageWeightPage> createState() => _PackageWeightPageState();
}

class _PackageWeightPageState extends State<PackageWeightPage> {
  final controller = GetIt.I.get<TravellerController>();

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
                CustomAppBarWithArrowAndCancelBarWidget(
                  height: 100,
                  title: 'Qual o peso do volume?',
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
                  },
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 1),
                  child: Text(
                    'Tamanho',
                    style: TextStylesConst.titilliumWeb16BoldGray,
                  ),
                ),
                const SizedBox(height: 16),
                const PackageWeightOptionsComponent(),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Visibility(
            visible: controller.packageWeight != null &&
                controller.packageWeight != PackageWeight.none,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  const SizedBox(height: 18),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Pular etapa',
                      style: TextStylesConst.titilliumWeb14BoldGray,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                      child: Material(
                        color: const Color(0xFF16A45C),
                        elevation: 5,
                        shadowColor: const Color(0xff222222),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/delivery_price');
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
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
