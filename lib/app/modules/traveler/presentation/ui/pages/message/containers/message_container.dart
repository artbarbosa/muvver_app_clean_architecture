import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/states/traveler_states.dart';

import '../../../controllers/traveler_controller.dart';
import '../message_error_page.dart';
import '../message_success_page.dart';

class MessageContainer extends StatelessWidget {
  MessageContainer({super.key});
  final controller = GetIt.I.get<TravelerController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value is TravelerSuccessState) {
          return MessageSuccessPage();
        } else if (value is TravelerErrorState) {
          return const MessageErrorPage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
