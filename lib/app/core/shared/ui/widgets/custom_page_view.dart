import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../modules/home/presentation/routers/home_route.dart';
import '../controllers/custom_bottom_navigation_bar_controller.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    final CustomBottomNavigationBarController controller =
        GetIt.I.get<CustomBottomNavigationBarController>();

    return PageView(
      controller: controller.pageController,
      children: const [
        HomeRoute(),
        Scaffold(
          body: Center(
            child: Text('Notificações'),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text('Chat'),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text('Pedidos'),
          ),
        ),
        Scaffold(
          body: Center(
            child: Text('Entregas'),
          ),
        ),
      ],
    );
  }
}
