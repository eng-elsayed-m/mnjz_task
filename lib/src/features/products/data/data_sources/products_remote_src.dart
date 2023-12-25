part of '../data.dart';

abstract class ProductsRemoteSrc {
  // BluePrint of remote source

  Future<List<ProductModel>> fetchProducts();
}

class ProductsRemoteSrcImpl implements ProductsRemoteSrc {
  final http.Client client;

  ProductsRemoteSrcImpl(this.client);
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await client.get(Uri.parse(AppUrls.products));

    if (response.statusCode < 400) {
      debugPrint(response.body);
      final List decodedResponse = json.decode(response.body);
      return decodedResponse.map((e) => ProductModel.fromMap(e)).toList();
    } else {
      throw ServerException('Error ${response.statusCode}');
    }
  }
}
