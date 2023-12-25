part of '../domain.dart';

abstract class ProductsRepository {
  //BluePrint of repository
  Future<Either<Failure, List<ProductEntity>>> fetchProducts();
}
