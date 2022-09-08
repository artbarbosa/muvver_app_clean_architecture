import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../../_design_system/consts/app_colors_const.dart';
import '../../../../../../../_design_system/consts/app_icons_const.dart';
import '../../../../../../../_design_system/widgets/list_tile/custom_list_tile_widget.dart';
import '../../../../../domain/value_objects/package_weight.dart';
import '../../../controllers/traveller_controller.dart';

class PackageWeightOptionsComponent extends StatefulWidget {
  const PackageWeightOptionsComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<PackageWeightOptionsComponent> createState() =>
      _PackageWeightOptionsComponentState();
}

class _PackageWeightOptionsComponentState
    extends State<PackageWeightOptionsComponent> {
  final controller = GetIt.I.get<TravellerController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomListTileWidget(
            title: 'Até 1 kg',
            icon: AppIconsConst.balanceOneKilos,
            trailing: Radio<PackageWeight>(
              activeColor: ColorsConst.green,
              value: PackageWeight.oneKilo,
              groupValue: controller.packageWeight.value,
              onChanged: (PackageWeight? value) {
                setState(
                  () {
                    controller.setPackageWeight(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Até 5 kg',
            icon: AppIconsConst.balanceFiveKilos,
            trailing: Radio<PackageWeight>(
              activeColor: ColorsConst.green,
              value: PackageWeight.fiveKilos,
              groupValue: controller.packageWeight.value,
              onChanged: (PackageWeight? value) {
                setState(
                  () {
                    controller.setPackageWeight(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Até 10 kg',
            icon: AppIconsConst.balanceTenKilos,
            trailing: Radio<PackageWeight>(
              activeColor: ColorsConst.green,
              value: PackageWeight.tenKilos,
              groupValue: controller.packageWeight.value,
              onChanged: (PackageWeight? value) {
                setState(
                  () {
                    controller.setPackageWeight(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Até 20 kg',
            icon: AppIconsConst.balanceTwentyKilos,
            trailing: Radio<PackageWeight>(
              activeColor: ColorsConst.green,
              value: PackageWeight.twentyKilos,
              groupValue: controller.packageWeight.value,
              onChanged: (PackageWeight? value) {
                setState(
                  () {
                    controller.setPackageWeight(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWidget(
            title: 'Outro',
            icon: AppIconsConst.balanceOthersKilos,
            trailing: Radio<PackageWeight>(
              activeColor: ColorsConst.green,
              value: PackageWeight.other,
              groupValue: controller.packageWeight.value,
              onChanged: (PackageWeight? value) {
                setState(
                  () {
                    controller.setPackageWeight(value);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
