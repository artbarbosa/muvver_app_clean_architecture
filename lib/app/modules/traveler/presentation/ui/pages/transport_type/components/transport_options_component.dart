import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../_design_system/consts/app_colors_const.dart';
import '../../../../../../../_design_system/consts/app_icons_const.dart';
import '../../../../../../../_design_system/widgets/list_tile/custom_list_tile_widget.dart';
import '../../../../../domain/value_objects/transport_types.dart';
import '../../../controllers/traveler_controller.dart';

class TransportOptionsComponent extends StatefulWidget {
  TransportOptionsComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<TransportOptionsComponent> createState() =>
      _TransportOptionsComponentState();
}

class _TransportOptionsComponentState extends State<TransportOptionsComponent> {
  final controller = GetIt.I.get<TravelerController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomListTileWidget(
            title: 'Carro',
            icon: AppIconsConst.car,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.car,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Avião',
            icon: AppIconsConst.airplane,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.airplane,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Caminhão',
            icon: AppIconsConst.truck,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.truck,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Van',
            icon: AppIconsConst.van,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.van,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Moto',
            icon: AppIconsConst.motorcycle,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.motorcycle,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Bicicleta',
            icon: AppIconsConst.bike,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.bicycle,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Trem',
            icon: AppIconsConst.train,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.train,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Ônibus',
            icon: AppIconsConst.bus,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.bus,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Embarcação',
            icon: AppIconsConst.boat,
            trailing: Radio<TransportTypes>(
              activeColor: ColorsConst.green,
              value: TransportTypes.ship,
              groupValue: controller.transportType,
              onChanged: (TransportTypes? value) {
                setState(
                  () {
                    controller.setTransportType(value);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
