import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';
import '../../../blocs/speciality/bloc.dart';
import '../../guide/guide_page.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<SpecialityCubit, SpecialityState>(
      builder: (context, state) {
        return PrimaryButton.blocProvider(
          label: TranslatedText(
            (c, _) => c.l10n.shared.continuee,
          ),
          onTap: state is SpecialityLoaded && state.hasSelection
              ? () => _onTap(
                    context,
                    state: state,
                  )
              : null,
        );
      },
    );
  }

  static Future<void> _onTap(
    BuildContext context, {
    required SpecialityLoaded state,
  }) async {
    await context.navigator.pushNamed(
      GuidePage.routeName,
      arguments: CreateRouteGuidePageArguments(
        selectedSpecialityIds: state.selectedSpecialityIds,
      ),
    );
  }
}
