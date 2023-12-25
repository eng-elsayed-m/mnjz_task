part of '../data.dart';

abstract class ProductsLocalSrc {
  // BluePrint of local source
  Future<List<ProductModel>> fetchProducts();
  Future<bool> saveData(List<ProductModel> products);
}

class ProductsLocaleSrcImpl implements ProductsLocalSrc {
  final SharedPreferences sh;

  ProductsLocaleSrcImpl(this.sh);
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = sh.getStringList(LocalKeys.products) ?? [];

    if (response.isNotEmpty) {
      final List<Map<String, dynamic>> decodedResponse =
          response.map((e) => json.decode(e) as Map<String, dynamic>).toList();
      return decodedResponse.map((e) => ProductModel.fromMap(e)).toList();
    } else {
      throw OfflineException();
    }
  }

  @override
  Future<bool> saveData(List<ProductModel> products) async {
    return sh
        .setStringList(
            LocalKeys.products, products.map((e) => e.toJson()).toList())
        .catchError((error) => throw OfflineException());
  }
}
