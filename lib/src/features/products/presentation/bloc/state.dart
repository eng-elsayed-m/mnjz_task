part of 'bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductEntity> products;

  const ProductsLoadedState({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String message;

  const ProductsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
