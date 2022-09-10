import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:muvver_app/app/_design_system/text_styles/text_styles_const.dart';

import '../../../../../../_design_system/widgets/app_bar/custom_app_bar_with_arrow_and_cancel_widget.dart';
import '../../../../../../core/shared/routers/routers.dart';
import '../../../../domain/value_objects/package_size.dart';
import '../../controllers/traveler_controller.dart';
import 'component/package_size_options_component.dart';

class PackageSizePage extends StatefulWidget {
  const PackageSizePage({super.key});

  @override
  State<PackageSizePage> createState() => _PackageSizePageState();
}

class _PackageSizePageState extends State<PackageSizePage> {
  final controller = GetIt.I.get<TravelerController>();

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
                  title:
                      'O volume que você pode deslocar tem tamanho similar a que?',
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
                    'Tamanhos',
                    style: TextStylesConst.titilliumWeb16BoldGray,
                  ),
                ),
                const SizedBox(height: 16),
                const PackageSizeOptionsComponent(),
                const SizedBox(height: 80),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller.packageSize,
            builder: (context, _, __) {
              return Visibility(
                visible: controller.packageSize.value != PackageSize.none,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        TextButton(
                          onPressed: () {
                            controller.setPackageSize(PackageSize.none);
                            Navigator.pushNamed(context, '/package_weight');
                          },
                          child: Text(
                            'Pular etapa',
                            style: TextStylesConst.titilliumWeb14BoldGray,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3)),
                            child: Material(
                              color: const Color(0xFF16A45C),
                              elevation: 5,
                              shadowColor: const Color(0xff222222),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/package_weight');
                                },
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Text(
                                    'Avançar',
                                    style:
                                        TextStylesConst.titilliumWeb16BoldWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
