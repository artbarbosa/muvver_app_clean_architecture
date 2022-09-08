import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:muvver_app/app/_design_system/widgets/text_form_field/custom_text_form_field_widget.dart';

import '../../../../../../_design_system/text_styles/text_styles_const.dart';
import '../../../../../../core/shared/utils/mask_text_input_formatter.dart';
import '../../controllers/traveller_controller.dart';

class RoutesPage extends StatefulWidget {
  const RoutesPage({Key? key}) : super(key: key);

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  final controller = GetIt.I.get<TravellerController>();

  final _formKey = GlobalKey<FormState>();
  final dateFormatter = MaskTextInputFormatter(mask: '##/##/####');

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Selecione a data e rota da sua viagem',
                      style: TextStylesConst.titilliumWeb16BoldGray,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormFieldWidget(
                          inputFormatters: [dateFormatter],
                          textEditingController: controller.dataControllerStart,
                          readOnly: true,
                          labelText: 'Data de chegada',
                          hintText: 'Data de chegada',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            final components = value.split("/");
                            if (components.length == 3) {
                              final day = int.tryParse(components[0]);
                              final month = int.tryParse(components[1]);
                              final year = int.tryParse(components[2]);
                              if (day != null &&
                                  month != null &&
                                  year != null) {
                                final date = DateTime(year, month, day);
                                if (date.year == year &&
                                    date.month == month &&
                                    date.day == day) {
                                  return null;
                                }
                              }
                            }
                            return "Data invalida";
                          },
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              lastDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 365 * 90)),
                              builder: (context, child) => Theme(
                                data: ThemeData(
                                  primaryColor: const Color(0xFF24B96E),
                                  buttonTheme: const ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary),
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xFF24B96E),
                                  ).copyWith(
                                    secondary: const Color(0xFF24B96E),
                                  ),
                                ),
                                child: child!,
                              ),
                            );

                            if (picked != null &&
                                picked.toString() !=
                                    controller.dataControllerStart.text) {
                              picked.toString();
                              setState(() {
                                controller.dataControllerStart.text =
                                    '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextFormFieldWidget(
                          inputFormatters: [dateFormatter],
                          textEditingController: controller.dataControllerEnd,
                          readOnly: true,
                          labelText: 'Data de chegada',
                          hintText: 'Data de chegada',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            final components = value.split("/");
                            if (components.length == 3) {
                              final day = int.tryParse(components[0]);
                              final month = int.tryParse(components[1]);
                              final year = int.tryParse(components[2]);
                              if (day != null &&
                                  month != null &&
                                  year != null) {
                                final date = DateTime(year, month, day);
                                if (date.year == year &&
                                    date.month == month &&
                                    date.day == day) {
                                  return null;
                                }
                              }
                            }
                            return "Data invalida";
                          },
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              lastDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 365 * 90)),
                              builder: (context, child) => Theme(
                                data: ThemeData(
                                  primaryColor: const Color(0xFF24B96E),
                                  buttonTheme: const ButtonThemeData(
                                      textTheme: ButtonTextTheme.primary),
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xFF24B96E),
                                  ).copyWith(
                                    secondary: const Color(0xFF24B96E),
                                  ),
                                ),
                                child: child!,
                              ),
                            );
                            if (picked != null &&
                                picked.toString() !=
                                    controller.dataControllerEnd.text) {
                              picked.toString();
                              setState(() {
                                controller.dataControllerEnd.text =
                                    '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 31),
                  SizedBox(
                    width: currentSize.width,
                    child: CustomTextFormFieldWidget(
                      textEditingController:
                          controller.dataControllerCitySource,
                      readOnly: false,
                      labelText: 'Cidade de origem',
                      hintText: 'Cidade de origem',
                    ),
                  ),
                  const SizedBox(height: 31),
                  SizedBox(
                    width: currentSize.width,
                    child: CustomTextFormFieldWidget(
                      textEditingController:
                          controller.dataControllerCityDestiny,
                      readOnly: false,
                      labelText: 'Cidade de destino',
                      hintText: 'Cidade de destino',
                    ),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/mid_point');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.add_circle_outline, size: 24),
                        const SizedBox(width: 9),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Adicionar ponto intermediário',
                              style: TextStylesConst.titilliumWeb16BoldGray,
                            ),
                            Text(
                              'E aumente sua chance de match',
                              style: TextStylesConst.titilliumWeb12RegularGray8,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                    Navigator.pushNamed(context, '/package_size');
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
    );
  }
}
