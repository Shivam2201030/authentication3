import 'package:dio/dio.dart';
import '../todo.dart';

class ProductController {
  final Dio _dio = Dio();
  final String _url = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get(_url);
    if (response.statusCode == 200) {
      final List productsData = response.data['products'];
      return productsData.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
