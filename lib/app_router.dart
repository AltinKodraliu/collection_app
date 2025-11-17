import 'package:collection_app/features/auth/presentation/pages/login_page.dart';
import 'package:collection_app/features/collection/data/models/product_model.dart';
import 'package:collection_app/features/collection/presentation/pages/collection_page.dart';
import 'package:collection_app/features/collection/presentation/pages/product_detail_page.dart';
import 'package:collection_app/features/welcome/presentation/pages/welcome_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const WelcomePage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/collection',
        builder: (context, state) => CollectionPage(),
      ),
      GoRoute(
        path: '/product_detail',
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return ProductDetailPage(product: product);
        },
      ),
    ],
  );
}
