import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';
import 'package:football_shop/main.dart' as main;

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16.0))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: main.footballShopPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: main.footballShopPrimaryColor,
              ),
            ),
            const SizedBox(height: 10),

            if (product.thumbnail.isNotEmpty)
              Center(
                child: Image.network(
                  'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 150),
                ),
              ),
            const Divider(height: 30),

            _buildDetailRow('Product ID:', product.id),
            _buildDetailRow('Price:', '\$${product.price}'),
            _buildDetailRow('Stock:', '${product.stock}'),
            _buildDetailRow('Category:', product.categoryDisplay),
            _buildDetailRow('Brand:', product.brand),
            _buildDetailRow(
              'Featured:',
              product.isFeatured ? 'Yes' : 'No',
            ),
            _buildDetailRow('Description:', ''),

            const SizedBox(height: 5),
            Text(
              product.description,
              style: const TextStyle(fontSize: 14.0),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: main.footballShopPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Back to Product List',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
