part of 'bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final FetchProductsUC fetchProductsUC;
  ProductsBloc({required this.fetchProductsUC})
      : super(ProductsInitialState()) {
    on<GetProductsEvent>(_getProducts);
  }
  List<ProductEntity> products = [];
  FutureOr<void> _getProducts(
      GetProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoadingState());
    final failureOrSections = await fetchProductsUC.call(NoParams());
    emit(failureOrSections.fold(
        (failure) => ProductsErrorState(message: mapFailureToMessage(failure)),
        (prods) {
      products = prods;
      return ProductsLoadedState(products: prods);
    }));
  }
}
