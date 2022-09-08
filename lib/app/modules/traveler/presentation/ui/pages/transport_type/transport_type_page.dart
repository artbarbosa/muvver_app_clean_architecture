import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:muvver_app/app/_design_system/text_styles/text_styles_const.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/pages/transport_type/components/transport_options_component.dart';

import '../../../../../../_design_system/widgets/app_bar/custom_app_bar_with_close_widget.dart';
import '../../../../../../core/shared/routers/routers.dart';
import '../../controllers/traveller_controller.dart';

class TransportTypePage extends StatefulWidget {
  const TransportTypePage({super.key});

  @override
  State<TransportTypePage> createState() => _TransportTypePageState();
}

class _TransportTypePageState extends State<TransportTypePage> {
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
                CustomAppBarWithCloseWidget(
                  title: 'Qual será o meio de transporte da sua viagem?',
                  subtitle: 'Viajante',
                  onClose: () {
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
                    'Transporte',
                    style: TextStylesConst.titilliumWeb16BoldGray,
                  ),
                ),
                const SizedBox(height: 16),
                TransportOptionsComponent(),
                const SizedBox(height: 80),
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
