import 'package:flutter/material.dart';
import 'package:football_shop/models/product.dart';

class ProductEntryCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductEntryCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    const String djangoBaseUrl = "http://localhost:8000";

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2.0)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Price: \$${product.price}"),
            Text("Category: ${product.categoryDisplay}"),
            Text("Featured: ${product.isFeatured ? 'Yes' : 'No'}"),

            if (product.thumbnail.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.network(
                  '$djangoBaseUrl/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text('Image failed to load'),
                ),
              ),

            Text(
              "Description: ${product.description.length > 50 ? '${product.description.substring(0, 50)}...' : product.description}",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
