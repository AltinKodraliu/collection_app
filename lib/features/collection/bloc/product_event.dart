import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductLoadRequested extends ProductEvent {}

class ProductFilterRequested extends ProductEvent {
  final String query;

  ProductFilterRequested(this.query);

  @override
  List<Object?> get props => [query];
}
