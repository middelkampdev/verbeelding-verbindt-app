import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/services/artist_service.dart';
import 'package:verbeelding_verbindt_core/services/location_service.dart';
import 'package:verbeelding_verbindt_core/services/permission_service.dart';
import 'package:verbeelding_verbindt_core/services/route_service.dart';

import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../theme.dart';
import 'guide_cubit.dart';
import 'guide_state.dart';
import 'widgets/route_list_item.dart';
import 'widgets/route_map.dart';

final serviceLocator = GetIt.instance;

class GuidePage extends StatelessWidget {
  const GuidePage._();

  static Widget blocProvider(
    GuidePageArguments arguments,
  ) {
    return BlocProvider(
      create: (context) {
        if (arguments is CreateRoutePageArguments) {
          return GuideCubit.createRoute(
            artistService: serviceLocator<ArtistService>(),
            permissionService: serviceLocator<PermissionService>(),
            locationService: serviceLocator<LocationService>(),
            routeService: serviceLocator<RouteService>(),
            selectedSpecialityIds: arguments.selectedSpecialityIds,
          );
        }
        return GuideCubit.openRoute(
          artistService: serviceLocator<ArtistService>(),
          permissionService: serviceLocator<PermissionService>(),
          locationService: serviceLocator<LocationService>(),
          routeService: serviceLocator<RouteService>(),
        );
      },
      child: const GuidePage._(),
    );
  }

  static const String routeName = 'route_guide/guide';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zoek de kunstenaar'),
      ),
      body: BlocBuilder<GuideCubit, GuideState>(
        builder: (context, state) {
          if (!state.stopsLoaded) {
            return Center(
              child: const VVCircleLoadingIndicator(
                label: 'Bezig met opzetten van route..',
              ),
            );
          }
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  RouteMap(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 3,
                    stops: state.stops!,
                    currentStop: state.currentStop!,
                    initialMapLocation: state.initialMapLocation!,
                  ),
                  Expanded(
                    child: Container(
                      decoration: getTopShadowBoxDecoration(context),
                      child: ListView.builder(
                        itemCount: state.stops!.length,
                        itemBuilder: (context, index) {
                          final stop = state.stops![index];
                          return RouteListItem(
                            count: state.stops!.length,
                            index: index,
                            stop: stop,
                            active: state.currentStop == stop,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

abstract class GuidePageArguments {
  const GuidePageArguments();
}

class CreateRoutePageArguments extends GuidePageArguments {
  const CreateRoutePageArguments({
    required this.selectedSpecialityIds,
  });

  final List<String> selectedSpecialityIds;
}

class OpenExistingRoutePageArguments extends GuidePageArguments {
  const OpenExistingRoutePageArguments();
}
