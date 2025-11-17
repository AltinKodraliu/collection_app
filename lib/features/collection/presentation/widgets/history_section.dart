import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  static const _gold = Color(0xFFFFB901);
  static const _cardColor = Color(0xFF122329);

  @override
  Widget build(BuildContext context) {
    final items = [0, 1];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: _cardColor.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 32, child: _buildTimeline(items.length)),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              children: [
                for (int i = 0; i < items.length; i++) ...[
                  _HistoryCard(),
                  if (i != items.length - 1) const SizedBox(height: 24),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(int itemCount) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalHeight = constraints.maxHeight == double.infinity
            ? 260.0
            : constraints.maxHeight;

        return SizedBox(
          height: totalHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned.fill(
                top: 8,
                bottom: 8,
                child: Center(
                  child: Container(
                    width: 2,
                    color: _gold.withValues(alpha: 0.7),
                  ),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (int i = 0; i < itemCount; i++) ...[
                    _bigCircle(),
                    if (i != itemCount - 1) ...[
                      const SizedBox(height: 32),
                      _diamond(),
                      const SizedBox(height: 32),
                    ],
                  ],
                  const Spacer(),
                  _diamond(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bigCircle() {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _diamond() {
    return Transform.rotate(
      angle: math.pi / 4,
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: _gold,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF101D22),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Label",
            style: GoogleFonts.lato(fontSize: 13, color: Colors.white70),
          ),
          const SizedBox(height: 4),
          Text(
            "Title",
            style: GoogleFonts.ebGaramond(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Description\nDescription",
            style: GoogleFonts.lato(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.attachment,
                      size: 16,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Attachments",
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Expanded(
                        child: Container(
                          height: 70,
                          margin: EdgeInsets.only(right: i == 2 ? 0 : 8),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
