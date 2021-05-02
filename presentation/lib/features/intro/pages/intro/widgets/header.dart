import 'package:flutter/material.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/font_weight.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Image.asset(
              'assets/images/intro-header.jpg',
              fit: BoxFit.cover,
              width: constraints.maxWidth,
              height: constraints.maxWidth / 2,
            );
          },
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text(
            '\'t Sal etaleert',
            style: context.textTheme.headline6!.copyWith(
              color: Colors.white,
              fontWeight: VVFontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}