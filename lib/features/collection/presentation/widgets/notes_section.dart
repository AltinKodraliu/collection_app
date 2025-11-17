import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  static const _cardColor = Color(0xFF0E1C21);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tasting notes",
          style: GoogleFonts.ebGaramond(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "by Charles MacLean MBE",
          style: GoogleFonts.lato(fontSize: 14, color: Colors.white70),
        ),

        const SizedBox(height: 20),

        _notesBlock(
          title: "Nose",
          lines: const ["Description", "Description", "Description"],
        ),

        const SizedBox(height: 16),

        _notesBlock(
          title: "Palate",
          lines: const ["Description", "Description", "Description"],
        ),

        const SizedBox(height: 16),

        _notesBlock(
          title: "Finish",
          lines: const ["Description", "Description", "Description"],
        ),
      ],
    );
  }

  Widget _notesBlock({required String title, required List<String> lines}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: _cardColor.withValues(alpha: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.ebGaramond(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),

          for (final line in lines)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                line,
                style: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
              ),
            ),
        ],
      ),
    );
  }
}
