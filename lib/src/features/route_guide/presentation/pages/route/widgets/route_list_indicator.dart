import 'package:flutter/material.dart';

import '../../../../../../shared/presentation/extensions/build_context_extensions.dart';
import '../../../../../../shared/presentation/font_weight.dart';

class RouteListIndicator extends StatelessWidget {
  const RouteListIndicator({
    Key? key,
    required this.count,
    required this.index,
    required this.active,
    this.width = 24.0,
  }) : super(key: key);

  final int count;
  final int index;
  final bool active;
  final double width;

  @override
  Widget build(
    BuildContext context,
  ) {
    final dark = context.theme.colorScheme.secondary;
    final light = context.theme.colorScheme.secondaryVariant;

    return CircleAvatar(
      radius: width / 2,
      backgroundColor: active ? dark : light,
      foregroundColor: context.theme.colorScheme.onSecondary,
      child: Center(
        child: Text(
          (index + 1).toString(),
          style: context.textTheme.bodyText2!.copyWith(
            color: context.theme.colorScheme.onPrimary,
            fontSize: width / 1.75,
            fontWeight: VVFontWeight.bold,
          ),
        ),
      ),
    );
  }
}
