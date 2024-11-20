import 'package:flutter/material.dart';
import 'package:dioapi/controller/controller.dart';
import 'package:dioapi/product/productdatail.dart';
import 'package:dioapi/todo.dart';
class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}
class _ProductViewState extends State<ProductView>
{
  final ProductController _controller = ProductController();
  late Future<List<Product>> _futureProducts;
  @override
  void initState() {
    super.initState();
    _futureProducts = _controller.fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(product.thumbnail),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
// late is non nullable value without initializing value in flutter