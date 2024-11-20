import 'package:flutter/material.dart';
import 'package:dioapi/todo.dart'; // Assuming your Product class is in this file
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final Barcode barcode = Barcode.code128();
    final barcodeData = barcode.toSvg(
      product.meta.barcode,
      width: 200,
      height: 80,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image carousel
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    product.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Product title
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Price
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 10),
            // Discount
            Text(
              'Discount: \$${product.discountPercentage}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 10),
            // Rating
            Text(
              'Rating: ${product.rating}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 10),
            // Category
            Text(
              'Category: ${product.category}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // Stock
            Text(
              'Stock: ${product.stock}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // Tags
            Text(
              'Tags:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Created At: ${product.tags}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Brand',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              '${product.brand}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            // Description
            Text(
              'Description:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${product.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Warranty
            Text(
              'Warranty: ${product.warrantyInformation}',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 10),
            // Shipping
            Text(
              'Shipping: ${product.shippingInformation}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Return Policy
            Text(
              'Return Policy: ${product.returnPolicy}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Meta data
            Text(
              'Meta:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Created At: ${product.meta.createdAt}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Updated At: ${product.meta.updatedAt}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Barcode: ${product.meta.barcode}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Barcode
            product.meta.barcode.isNotEmpty
                ? SvgPicture.string(
              barcodeData,
              width: 200,
              height: 80,
            )
                : Text('No Barcode available'),
            SizedBox(height: 10),
            // QR Code
            Text(
              'QR Code:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            product.meta.qrCode.isNotEmpty
                ? Image.network(
              product.meta.qrCode,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            )
                : Text('No QR Code available'),
            SizedBox(height: 10),
            // SKU
            Text(
              'Sku: ${product.sku}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Dimensions
            Text(
              'Dimensions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Height: ${product.dimensions.height}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Width: ${product.dimensions.width}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Depth: ${product.dimensions.depth}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            // Reviews
            Text(
              'Reviews',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rating: ${product.rating}',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            // Minimum Order Quantity
            Text(
              'Minimum Order Quantity:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,  // Ensures the Row takes minimal space
              children: [
                Icon(Icons.arrow_forward, size: 10),
                Text(
                  '${product.minimumOrderQuantity}',
                  style: TextStyle(fontSize: 16),
                ),

              ],
            ),

            SizedBox(height: 20),
            // Buy Now Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              onPressed: () {},
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
