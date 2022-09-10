import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:muvver_app/app/modules/traveler/domain/value_objects/package_size.dart';

import '../../../../../../../_design_system/consts/app_colors_const.dart';
import '../../../../../../../_design_system/consts/app_icons_const.dart';
import '../../../../../../../_design_system/widgets/list_tile/custom_list_tile_with_subtitle_widget.dart';
import '../../../controllers/traveler_controller.dart';

class PackageSizeOptionsComponent extends StatefulWidget {
  const PackageSizeOptionsComponent({Key? key}) : super(key: key);

  @override
  State<PackageSizeOptionsComponent> createState() =>
      _PackageSizeOptionsComponentState();
}

class _PackageSizeOptionsComponentState
    extends State<PackageSizeOptionsComponent> {
  final controller = GetIt.I.get<TravelerController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomListTileWithSubtitleWidget(
            title: 'Envelope',
            subtitle: '00 x 00 cm',
            icon: AppIconsConst.envelope,
            trailing: Radio<PackageSize>(
              activeColor: ColorsConst.green,
              value: PackageSize.envelope,
              groupValue: controller.packageSize.value,
              onChanged: (PackageSize? value) {
                setState(
                  () {
                    controller.setPackageSize(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWithSubtitleWidget(
            title: 'Livro',
            subtitle: '00 x 00 cm',
            icon: AppIconsConst.book,
            trailing: Radio<PackageSize>(
              activeColor: ColorsConst.green,
              value: PackageSize.book,
              groupValue: controller.packageSize.value,
              onChanged: (PackageSize? value) {
                setState(
                  () {
                    controller.setPackageSize(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWithSubtitleWidget(
            title: 'Caixa de sapato',
            subtitle: '00 x 00 cm',
            icon: AppIconsConst.shoeBox,
            trailing: Radio<PackageSize>(
              activeColor: ColorsConst.green,
              value: PackageSize.shoeBox,
              groupValue: controller.packageSize.value,
              onChanged: (PackageSize? value) {
                setState(
                  () {
                    controller.setPackageSize(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWithSubtitleWidget(
            title: 'Mochila',
            subtitle: '00 x 00 cm',
            icon: AppIconsConst.backpack,
            trailing: Radio<PackageSize>(
              activeColor: ColorsConst.green,
              value: PackageSize.schoolbag,
              groupValue: controller.packageSize.value,
              onChanged: (PackageSize? value) {
                setState(
                  () {
                    controller.setPackageSize(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWithSubtitleWidget(
            title: 'Mala Grande',
            subtitle: '00 x 00 cm',
            icon: AppIconsConst.bigSuitcase,
            trailing: Radio<PackageSize>(
              activeColor: ColorsConst.green,
              value: PackageSize.bigSuitcase,
              groupValue: controller.packageSize.value,
              onChanged: (PackageSize? value) {
                setState(
                  () {
                    controller.setPackageSize(value);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1, color: ColorsConst.dividerGray),
          CustomListTileWithSubtitleWidget(
            title: 'Caixa Grande',
            subtitle: '00 x 00 cm',
            icon: AppIconsConst.bigBox,
            trailing: Radio<PackageSize>(
              activeColor: ColorsConst.green,
              value: PackageSize.bigBox,
              groupValue: controller.packageSize.value,
              onChanged: (PackageSize? value) {
                setState(
                  () {
                    controller.setPackageSize(value);
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
