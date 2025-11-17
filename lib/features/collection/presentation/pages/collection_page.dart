import 'package:collection_app/features/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../collection/bloc/product_bloc.dart';
import '../../../collection/bloc/product_event.dart';
import '../../../collection/bloc/product_state.dart';
import '../widgets/product_card.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1C21),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1C21),
        elevation: 0,
        title: Text(
          'My collection',
          style: GoogleFonts.ebGaramond(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(
              "assets/images/notification-icon.png",
              width: 32,
            ),
          ),
        ],
      ),

      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (state.error != null) {
            return Center(
              child: Text(
                state.error!,
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }

          if (state.filtered.isEmpty) {
            return const Center(
              child: Text(
                "No products found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return RefreshIndicator(
            backgroundColor: const Color(0xFF0E1C21),
            color: Colors.white,
            onRefresh: () async {
              context.read<ProductBloc>().add(ProductLoadRequested());
              await Future.delayed(const Duration(milliseconds: 500));
            },
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.filtered.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 18,
                childAspectRatio: 0.60,
              ),
              itemBuilder: (context, index) {
                final product = state.filtered[index];

                return ProductCard(
                  product: product,
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push('/product_detail', extra: product);
                  },
                );
              },
            ),
          );
        },
      ),

      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
