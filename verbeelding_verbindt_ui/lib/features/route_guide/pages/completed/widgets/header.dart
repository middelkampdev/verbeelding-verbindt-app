import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../../../../shared/font_weight.dart';
import '../../../../../shared/widgets/text/translatable_text.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.images.introHeader.assetName,
              bundle: Assets.images.introHeader.bundle,
              package: Assets.images.introHeader.package,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: DefaultTextStyle(
              style: context.textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: VVFontWeight.bold,
              ),
              child: TranslatedText(
                (c, _) => c.l10n.completedPage.title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}