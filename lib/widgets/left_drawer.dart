import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/product_list.dart';
import 'package:football_shop/screens/productlist_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/screens/login.dart';

const Color footballShopPrimaryColor = Color(0xFF228B22);

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: footballShopPrimaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Footballed Co.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Find all your football gear here!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: footballShopPrimaryColor),
            title: const Text(
              'Home',
              style: TextStyle(color: footballShopPrimaryColor),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_basket,
              color: footballShopPrimaryColor,
            ),
            title: const Text(
              'All Products',
              style: TextStyle(color: footballShopPrimaryColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage(filterUser: false),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_pin,
              color: footballShopPrimaryColor,
            ),
            title: const Text(
              'My Products',
              style: TextStyle(color: footballShopPrimaryColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage(filterUser: true),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box, color: footballShopPrimaryColor),
            title: Text(
              'Create Product',
              style: TextStyle(color: footballShopPrimaryColor),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductListForm(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: footballShopPrimaryColor),
            title: Text(
              'Logout',
              style: TextStyle(color: footballShopPrimaryColor),
            ),
            onTap: () async {
              final request = Provider.of<CookieRequest>(context, listen: false);
              await request.logout("http://localhost:8000/auth/logout/");
              request.loggedIn = false;
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
