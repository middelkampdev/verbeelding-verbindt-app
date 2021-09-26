import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../extensions/build_context_extensions.dart';

class ButtonSpinner extends StatelessWidget {
  const ButtonSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return SpinKitRing(
      color: context.theme.colorScheme.onPrimary,
      lineWidth: 2,
      size: context.theme.textTheme.button!.fontSize ?? 14,
    );
  }
}
