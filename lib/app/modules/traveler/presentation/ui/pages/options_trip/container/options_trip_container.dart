import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../_design_system/consts/app_colors_const.dart';
import '../../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../../_design_system/widgets/app_bar/custom_app_bar_with_tab_bar_widget.dart';
import '../../../../../../../core/shared/routers/routers.dart';
import '../../../controllers/traveler_controller.dart';
import '../map_page.dart';
import '../routes_page.dart';

class OptionsTripContainerPage extends StatefulWidget {
  const OptionsTripContainerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OptionsTripContainerPage> createState() =>
      _OptionsTripContainerPageState();
}

class _OptionsTripContainerPageState extends State<OptionsTripContainerPage> {
  final controller = GetIt.I.get<TravelerController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsConst.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(151.0),
          child: CustomAppBarWithTabBarWidget(
            title: 'Qual trajeto da sua viagem?',
            subtitle: 'Ser um Muvver',
            tabs: [
              Text(
                'Rotas',
                style: TextStylesConst.titilliumWeb14BoldWhite,
              ),
              Text(
                'Mapa',
                style: TextStylesConst.titilliumWeb14BoldWithOpacty,
              ),
            ],
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
        ),
        body: const TabBarView(
          children: [
            RoutesPage(),
            MapPage(),
          ],
        ),
      ),
    );
  }
}
