import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/domain/services/persistent_storage/persistent_storage_service.dart';
import '../../../../shared/presentation/extensions/build_context_extensions.dart';
import '../../../route_guide/presentation/pages/select_interests/select_interests_page.dart';
import '../bloc/intro_cubit.dart';
import '../bloc/intro_state.dart';
import '../widgets/continue_button.dart';
import '../widgets/description.dart';
import '../widgets/header.dart';

final sl = GetIt.instance;

class IntroPage extends StatelessWidget {
  IntroPage._();

  static Widget blocProvider() {
    return BlocProvider(
      create: (context) => IntroCubit(
        persistentStorageService: sl<PersistentStorageService>(),
      ),
      child: BlocListener<IntroCubit, IntroState>(
        listener: (context, state) async {
          if (state.loaded && state.accepted!) {
            await context.navigator.pushNamed(
              SelectInterestsPage.routeName,
            );
          }
        },
        child: IntroPage._(),
      ),
    );
  }

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => IntroPage.blocProvider(),
    );
  }

  static const String routeName = '/route_guide/intro';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: const Description(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const ContinueButton(),
            ),
          ],
        ),
      ),
    );
  }
}