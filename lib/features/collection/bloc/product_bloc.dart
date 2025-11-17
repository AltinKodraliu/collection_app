import 'package:collection_app/features/collection/data/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;

  ProductBloc({required this.service}) : super(ProductState.initial()) {
    on<ProductLoadRequested>(_onLoad);
    on<ProductFilterRequested>(_onFilter);
  }

  Future<void> _onLoad(
    ProductLoadRequested event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final list = await service.loadProducts();
      emit(state.copyWith(all: list, filtered: list, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  void _onFilter(ProductFilterRequested event, Emitter<ProductState> emit) {
    final q = event.query.toLowerCase();

    final filtered = state.all.where((p) {
      return p.name.toLowerCase().contains(q) ||
          p.description.toLowerCase().contains(q);
    }).toList();

    emit(state.copyWith(filtered: filtered));
  }
}
