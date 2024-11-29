import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart'; // Import your custom theme
import 'product.dart'; // Import the product model

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store', // App title
      theme: AppTheme.lightTheme, // Light theme from theme.dart
      darkTheme: AppTheme.darkTheme, // Dark theme from theme.dart
      themeMode: ThemeMode.light, // Default theme is light
      home: const CatalogPage(), // Home page for the app
    );
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Step 4: Product list setup
    final List<Product> products = [
      Product(
          name: 'Smartphone',
          imageUrl:
              'lib/assets/smartphone.jpg', // Replace URL with local asset path
          price: 699.99),
      Product(
          name: 'Headphones',
          imageUrl:
              'lib/assets/headphone.jpg', // Replace URL with local asset path
          price: 299.99),
      Product(
          name: 'Smartwatch',
          imageUrl:
              'lib/assets/smartwatch.jpg', // Replace URL with local asset path
          price: 199.99),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Store'), // AppBar with title
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // Step 4: Toggle between light and dark themes
              Get.isDarkMode
                  ? Get.changeTheme(
                      AppTheme.lightTheme) // Switch to light theme
                  : Get.changeTheme(AppTheme.darkTheme); // Switch to dark theme
            },
          ),
        ],
      ),
      body: GridView.builder(
        // Step 4: GridView to display products
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two products per row
          mainAxisSpacing: 8.0, // Vertical spacing
          crossAxisSpacing: 8.0, // Horizontal spacing
          childAspectRatio: 3 / 4, // Width to height ratio for the cards
        ),
        itemCount: products.length, // Total products
        itemBuilder: (context, index) {
          final product = products[index]; // Get current product
          return GestureDetector(
            onTap: () {
              // Step 4: Show a notification/snackbar with the product name
              Get.snackbar('Product Selected', product.name,
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: Card(
              // Step 4: Build the product card
              elevation: 4.0, // Adds shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded edges
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      product.imageUrl, // Product image
                      fit: BoxFit.cover, // Scales the image
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name, // Product name
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4.0),
                        Text('\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Color.fromARGB(
                                    255, 121, 118, 118))), // Price
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
