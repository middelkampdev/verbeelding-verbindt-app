import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../services/speciality_service.dart';
import 'bloc/barrel.dart';
import 'widgets/next_button.dart';
import 'widgets/specialties_list.dart';

final sl = GetIt.instance;

class SelectInterestsPage extends StatelessWidget {
  SelectInterestsPage._();

  static const String routeName = '/route_planner/select-interests';

  static Widget blocProvider() {
    return BlocProvider(
      create: (context) => PageCubit(
        specialityService: sl<SpecialityService>(),
      ),
      child: SelectInterestsPage._(),
    );
  }

  // TODO: implement Flutter navigtor 2.0
  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => SelectInterestsPage.blocProvider(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interesses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Maak hier uw selectie:'),
            const SizedBox(height: 16),
            Expanded(
              child: SpecialitiesList(),
            ),
            const SizedBox(height: 16),
            const Divider(height: 2),
            Container(
              width: double.infinity,
              child: NextButton(),
            ),
          ],
        ),
      ),
    );
  }
}