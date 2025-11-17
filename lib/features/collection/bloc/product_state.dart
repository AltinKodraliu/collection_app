import 'package:collection_app/features/collection/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final List<ProductModel> all;
  final List<ProductModel> filtered;
  final bool loading;
  final String? error;

  const ProductState({
    required this.all,
    required this.filtered,
    required this.loading,
    this.error,
  });

  factory ProductState.initial() =>
      const ProductState(all: [], filtered: [], loading: false);

  ProductState copyWith({
    List<ProductModel>? all,
    List<ProductModel>? filtered,
    bool? loading,
    String? error,
  }) {
    return ProductState(
      all: all ?? this.all,
      filtered: filtered ?? this.filtered,
      loading: loading ?? this.loading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [all, filtered, loading, error];
}
