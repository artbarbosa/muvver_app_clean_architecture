import 'package:flutter/material.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/pages/delivery_price/delivery_price_page.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/pages/message/message_page.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/pages/mid_point/mid_point_page.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/pages/options_trip/container/options_trip_container.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/pages/package_size/package_size_page.dart';
import 'package:muvver_app/app/modules/traveler/presentation/ui/pages/package_weight/package_weight_page.dart';

import '../ui/pages/transport_type/transport_type_page.dart';

class TraveleRouter extends StatelessWidget {
  const TraveleRouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/transport_type',
      onGenerateRoute: (settings) {
        if (settings.name == '/transport_type') {
          return MaterialPageRoute(
            builder: (context) {
              return const TransportTypePage();
            },
          );
        }
        if (settings.name == '/options_trip') {
          return MaterialPageRoute(
            builder: (context) {
              return const OptionsTripContainerPage();
            },
          );
        }
        if (settings.name == '/mid_point') {
          return MaterialPageRoute(
            builder: (context) {
              return const MidPointPage();
            },
          );
        }
        if (settings.name == '/delivery_price') {
          return MaterialPageRoute(
            builder: (context) {
              return const DeliveryPricePage();
            },
          );
        }
        if (settings.name == '/package_size') {
          return MaterialPageRoute(
            builder: (context) {
              return const PackageSizePage();
            },
          );
        }
        if (settings.name == '/package_weight') {
          return MaterialPageRoute(
            builder: (context) {
              return const PackageWeightPage();
            },
          );
        }
        if (settings.name == '/message') {
          return MaterialPageRoute(
            builder: (context) {
              return const MessagePage();
            },
          );
        }
        return null;
      },
    );
  }
}
