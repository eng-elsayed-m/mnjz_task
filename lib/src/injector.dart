part of 'src.dart';

final sl = GetIt.instance;
Future<void> initInjection() async {
//------------ General Dependancies -------------
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  final shp = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => shp);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
//----------------------  Products -----------------
  sl.registerFactory(
    () => ProductsBloc(fetchProductsUC: sl()),
  );
  // Use Cases
  sl.registerLazySingleton(() => FetchProductsUC(sl()));
  //  Repository
  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
        remoteSrc: sl(),
        networkInfo: sl(),
        localSrc: sl(),
      ));
  //  Data Sources
  sl.registerLazySingleton<ProductsLocalSrc>(() => ProductsLocaleSrcImpl(sl()));
  sl.registerLazySingleton<ProductsRemoteSrc>(
      () => ProductsRemoteSrcImpl(sl()));
}
