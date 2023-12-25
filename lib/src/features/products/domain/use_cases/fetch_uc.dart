part of '../domain.dart';

class FetchProductsUC extends UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepository repository;
  FetchProductsUC(this.repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await repository.fetchProducts();
  }
}
