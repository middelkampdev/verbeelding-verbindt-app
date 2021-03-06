import 'package:flutter/material.dart';

class VVListTile extends StatelessWidget {
  const VVListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTileTheme(
      selectedTileColor: theme.colorScheme.primary.withOpacity(0.05),
      selectedColor: theme.colorScheme.primary,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        selected: selected,
        onTap: onTap,
      ),
    );
  }
}
