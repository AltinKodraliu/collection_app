import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  static const _rowColor = Color(0xFF122329);
  static const _textColor = Colors.white;
  static const _secondaryColor = Colors.white70;

  @override
  Widget build(BuildContext context) {
    final entries = [
      "Distillery",
      "Region",
      "Country",
      "Type",
      "Age statement",
      "Filled",
      "Bottled",
      "Cask number",
      "ABV",
      "Size",
      "Finish",
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _rowColor.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          for (final label in entries)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.lato(fontSize: 15, color: _textColor),
                  ),
                  Text(
                    "Text",
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: _secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
