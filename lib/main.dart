import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection_app/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/collection/bloc/product_bloc.dart';
import 'features/collection/bloc/product_event.dart';
import 'features/collection/data/services/product_service.dart';

void main() {
  final productService = ProductService(
    remoteUrl:
        'https://raw.githubusercontent.com/<username>/<repo>/main/products.json',
  );

  runApp(
    BlocProvider(
      create: (_) =>
          ProductBloc(service: productService)..add(ProductLoadRequested()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Collection App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B1519),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0B1519)),
        textTheme: GoogleFonts.ebGaramondTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
