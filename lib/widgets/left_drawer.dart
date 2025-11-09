import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productlist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                children: [
                  Text(
                    'Footballed Co.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "The best football shop in town!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            // Home
            ListTile(
              leading: Icon(Icons.home_outlined, color: Colors.green),
              title: Text('Home', style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            // All Products
            ListTile(
              leading: Icon(Icons.list_alt, color: Colors.green),
              title: Text('All Products', style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            // My Products
            ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: Text('My Products', style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            // Create Product
            ListTile(
              leading: Icon(Icons.add_box, color: Colors.green),
              title: Text('Create Product', style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductListForm()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}