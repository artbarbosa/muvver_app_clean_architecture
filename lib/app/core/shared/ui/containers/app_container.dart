import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../_design_system/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';
import '../widgets/custom_page_view.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final controllerBottomNavigation =
      GetIt.I.get<CustomBottomNavigationBarController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: const CustomPageView(),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: controllerBottomNavigation,
          builder: (context, value, _) {
            return CustomBottomNavigationBar(
              currentIndex: value,
              onTap: (value) => controllerBottomNavigation.changePage(value),
            );
          },
        ),
      ),
    );
  }
}
