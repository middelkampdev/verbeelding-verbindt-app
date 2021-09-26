import 'package:flutter/material.dart';

import '../../extensions/build_context_extensions.dart';
import '../../widgets/text/translatable_text.dart';

class _ErrorDialog extends StatelessWidget {
  const _ErrorDialog({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final TranslatedTextCallback title;
  final TranslatedTextCallback message;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.error),
          const SizedBox(width: 4),
          TranslatedText(title),
        ],
      ),
      content: TranslatedText(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: TranslatedText(
            (c, _) => c.l10n.shared.ok,
          ),
        )
      ],
    );
  }
}

void showErrorDialog(
  BuildContext context, {
  required TranslatedTextCallback title,
  required TranslatedTextCallback message,
}) {
  showDialog(
    context: context,
    builder: (context) => _ErrorDialog(
      title: title,
      message: message,
    ),
  );
}

void showUnknownErrorDialog(
  BuildContext context, {
  required Exception exception,
}) {
  showErrorDialog(
    context,
    title: (c, _) => c.l10n.errorDialog.unknownErrorTitle,
    message: (c, _) => c.l10n.errorDialog.unknownErrorMessage,
  );
}