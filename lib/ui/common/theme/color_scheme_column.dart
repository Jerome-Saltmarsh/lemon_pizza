

import 'package:flutter/material.dart';

class ColorSchemeColumn extends StatelessWidget {

  final ColorScheme colorScheme;

  const ColorSchemeColumn({required this.colorScheme, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("BRIGHTNESS ${colorScheme.brightness.name.toUpperCase()}"),
          const SizedBox(height: 32,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PaletteColorRow(name: "Primary", color: colorScheme.primary),
                  PaletteColorRow(name: "On Primary", color: colorScheme.onPrimary),
                  PaletteColorRow(name: "Primary Container", color: colorScheme.primaryContainer),
                  PaletteColorRow(name: "On Primary Container", color: colorScheme.onPrimaryContainer),

                  PaletteColorRow(name: "Surface", color: colorScheme.surface),
                  PaletteColorRow(name: "On Surface", color: colorScheme.onSurface),
                  PaletteColorRow(name: "Surface Variant", color: colorScheme.surfaceVariant),
                  PaletteColorRow(name: "On Surface Variant", color: colorScheme.onSurfaceVariant),

                  PaletteColorRow(name: "On Inverse Surface", color: colorScheme.onInverseSurface),
                  PaletteColorRow(name: "Surface Tint", color: colorScheme.surfaceTint),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PaletteColorRow(name: "Secondary", color: colorScheme.secondary),
                  PaletteColorRow(name: "On Secondary", color: colorScheme.onSecondary),
                  PaletteColorRow(name: "Secondary Container", color: colorScheme.secondaryContainer),
                  PaletteColorRow(name: "On Secondary Container", color: colorScheme.onSecondaryContainer),

                  PaletteColorRow(name: "Background", color: colorScheme.background),
                  PaletteColorRow(name: "On Background", color: colorScheme.onBackground),
                  PaletteColorRow(name: "Inverse Primary", color: colorScheme.inversePrimary),
                  PaletteColorRow(name: "Inverse Surface", color: colorScheme.inverseSurface),

                  PaletteColorRow(name: "Outline", color: colorScheme.outline),
                  PaletteColorRow(name: "Outline Variant", color: colorScheme.outlineVariant),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PaletteColorRow(name: "Tertiary", color: colorScheme.tertiary),
                  PaletteColorRow(name: "On Tertiary", color: colorScheme.onTertiary),
                  PaletteColorRow(name: "Secondary Tertiary", color: colorScheme.tertiaryContainer),
                  PaletteColorRow(name: "On Secondary Tertiary", color: colorScheme.onTertiaryContainer),

                  PaletteColorRow(name: "Error", color: colorScheme.error),
                  PaletteColorRow(name: "Error Container", color: colorScheme.errorContainer),
                  PaletteColorRow(name: "On Error Container", color: colorScheme.onErrorContainer),
                  PaletteColorRow(name: "Scrim", color: colorScheme.scrim),

                  PaletteColorRow(name: "Shadow", color: colorScheme.shadow),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaletteColorRow extends StatelessWidget {

  final Color color;
  final String name;

  const PaletteColorRow({super.key, required this.color, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 170,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8),
            child: Text(name),
        ),
        Container(width: 100, height: 50, color: color),
      ],
    );
  }
}