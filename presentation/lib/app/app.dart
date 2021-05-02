import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/intro/pages/intro/intro_page.dart';
import '../features/route_guide/pages/select_interests/select_interests_page.dart';
import '../routes.dart';
import '../shared/widgets/misc/flavor_banner.dart';
import '../theme.dart';
import 'app_cubit.dart';
import 'app_state.dart';

final serviceLocator = GetIt.instance;

class App extends StatelessWidget {
  App._();

  static Widget blocProvider({
    required GlobalKey<NavigatorState> navigatorKey,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(
            persistentStorageService: serviceLocator(),
            navigatorKey: navigatorKey,
          ),
        ),
      ],
      child: App._(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final botToastBuilder = BotToastInit();
        return MaterialApp(
          title: '\'t Sal etaleert',
          theme: buildAppTheme(context),
          home: _buildHome(state),
          builder: (context, child) {
            return FlavorBanner(
              child: botToastBuilder(context, child),
              navigatorKey: state.navigatorKey,
            );
          },
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          onGenerateRoute: onGenerateRoute,
          navigatorKey: state.navigatorKey,
        );
      },
    );
  }

  Widget _buildHome(
    AppState state,
  ) {
    if (!state.loaded) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state.introAccepted != true) {
      return IntroPage.blocProvider();
    }
    return SelectInterestsPage.blocProvider();
  }
}