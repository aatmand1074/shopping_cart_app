import 'package:flutter/material.dart';
import 'cart.dart';
import 'product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final Cart cart;
  final Function(Cart) onCartUpdated;

  const ProductDetailsScreen({
    required this.product,
    required this.cart,
    required this.onCartUpdated,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? 'Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Image.asset(
                product.imagePath ?? 'assets/images/phone1.jpeg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.image,
                  size: 100,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? 'Unknown Product',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.brand ?? 'Unknown Brand',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '₹${(product.price ?? 0.0).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black54,
                          decorationThickness: 2,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        '₹${(product.discountedPrice ?? 0.0).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${product.discount ?? 0}% OFF',
                    style: TextStyle(fontSize: 16, color: Colors.pink),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.description ?? 'No description available.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        onCartUpdated(cart.addProduct(product));
                        // Removed: showCenteredMessage(context, '${product.name ?? 'Product'} added to cart');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}