import 'package:collection_app/features/collection/data/models/product_model.dart';
import 'package:collection_app/features/collection/presentation/widgets/details_section.dart';
import 'package:collection_app/features/collection/presentation/widgets/history_section.dart';
import 'package:collection_app/features/collection/presentation/widgets/notes_section.dart';
import 'package:collection_app/features/shared/widgets/app_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  static const Color gold = Color(0xFFFFB901);
  static const Color cardColor = Color(0xFF122329);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Text(
                            "Genesis Collection",
                            style: GoogleFonts.ebGaramond(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            splashRadius: 22,
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: ProductDetailPage.gold,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Genuine Bottle (Unopened)",
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      Center(
                        child: SizedBox(
                          height: 450,
                          child: Image.network(
                            widget.product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          color: ProductDetailPage.cardColor.withValues(
                            alpha: 0.9,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bottle 135/184",
                              style: GoogleFonts.lato(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 10),

                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.product.name,
                                    style: GoogleFonts.ebGaramond(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 18 Year old",
                                    style: GoogleFonts.ebGaramond(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: ProductDetailPage.gold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "#2504",
                              style: GoogleFonts.ebGaramond(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 24),

                            _buildTabBar(),
                            const SizedBox(height: 24),

                            _buildTabContent(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ProductDetailPage.gold,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add, size: 18),
                              const SizedBox(width: 10),
                              Text(
                                "Add to my collection",
                                style: GoogleFonts.ebGaramond(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildTab(0, "Details"),
          _buildTab(1, "Tasting notes"),
          _buildTab(2, "History"),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String label) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? ProductDetailPage.gold : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: isSelected ? Colors.black : Colors.white70,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return const DetailsSection();
      case 1:
        return const NotesSection();
      case 2:
        return const HistorySection();
      default:
        return const SizedBox.shrink();
    }
  }
}
