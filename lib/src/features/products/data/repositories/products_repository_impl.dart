part of '../data.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  //The Layer between Sources and State Management Layers
  final ProductsRemoteSrc remoteSrc;
  final ProductsLocalSrc localSrc;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl(
      {required this.remoteSrc,
      required this.localSrc,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    try {
      //Load data from remote/local sources in case Connected/NotConnected
      //And save Data in case Connection established
      final remoteSections = await networkInfo.isConnected
          ? await remoteSrc.fetchProducts().then((value) async {
              localSrc.saveData(value);
              return value;
            })
          : await localSrc.fetchProducts();
      return Right(remoteSections);
    }
    //Handle local/Remote exception
    on ServerException catch (ex) {
      return Left(ServerFailure(ex.message));
    } on OfflineException {
      return Left(OfflineFailure());
    }
  }
}
