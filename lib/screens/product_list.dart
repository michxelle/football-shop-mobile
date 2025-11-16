import 'package:flutter/material.dart';
import 'package:football_shop/main.dart' as main;
import 'package:football_shop/models/product.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final bool filterUser;

  const ProductPage({super.key, this.filterUser = false});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    String url = "http://localhost:8000/json/";
    if (widget.filterUser) {
      url += "?user=logged_in";
    }
    var response = await request.get(url);
    try {
      List<Product> listProduct = [];
      for (var d in response) {
        if (d != null) {
          listProduct.add(Product.fromJson(d));
        }
      }
      return listProduct;
    } catch (e) {
      return Future.error('Failed to load products.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filterUser ? 'My Products' : 'All Products List'),
        backgroundColor: main.footballShopPrimaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            String message = "No product data available.";
            if (widget.filterUser) {
              if (!request.loggedIn) {
                message = "Please log in to view your products.";
              } else {
                message = "You haven't added any products yet!";
              }
            }
            return Center(
              child: Text(
                message,
                style: TextStyle(
                  color: main.footballShopPrimaryColor,
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                Product product = snapshot.data![index];
                return ProductEntryCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
