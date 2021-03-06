import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../verbeelding_verbindt_ui.dart';

class CustomThemeData extends Equatable with Diagnosticable {
  factory CustomThemeData({
    CustomThemeColorScheme? colorScheme,
    ThemeData? materialTheme,
  }) {
    colorScheme ??= kDefaultThemeColorSchemeLight;
    materialTheme ??= ThemeData(
      primaryColor: colorScheme.primary,
      primaryColorBrightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.divider,
      shadowColor: colorScheme.shadow,
      iconTheme: const IconThemeData.fallback().copyWith(
        color: colorScheme.onSurface,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.small,
          ),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.medium,
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.medium,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: colorScheme.secondary,
          padding: const EdgeInsets.all(
            PaddingSize.big,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          primary: colorScheme.onSurface,
          padding: const EdgeInsets.all(
            PaddingSize.big,
          ),
          side: BorderSide(
            color: colorScheme.border,
            width: 1.5,
          ),
        ),
      ),
    );
    return CustomThemeData._(
      materialTheme: materialTheme,
      colorScheme: colorScheme,
    );
  }

  CustomThemeData._({
    required this.materialTheme,
    required this.colorScheme,
  });

  final ThemeData materialTheme;

  final CustomThemeColorScheme colorScheme;

  CustomThemeData copyWith({
    ThemeData? materialTheme,
    CustomThemeColorScheme? colorScheme,
  }) {
    return CustomThemeData(
      materialTheme: materialTheme ?? this.materialTheme,
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }

  CustomThemeData resolve(BuildContext context) => this;

  @override
  List<Object?> get props => [
        materialTheme,
        colorScheme,
      ];

  @override
  void debugFillProperties(
    DiagnosticPropertiesBuilder properties,
  ) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
      'materialTheme',
      materialTheme,
      defaultValue: null,
    ));
    properties.add(DiagnosticsProperty(
      'colorScheme',
      colorScheme,
      defaultValue: null,
    ));
  }
}
