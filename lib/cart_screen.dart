import 'package:flutter/material.dart';
import 'cart.dart';
import 'utils.dart';

class CartScreen extends StatelessWidget {
  final Cart cart;
  final Function(Cart) onCartUpdated;

  CartScreen({required this.cart, required this.onCartUpdated});

  @override
  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Dynamically calculate crossAxisCount (number of columns)
    const minItemWidth = 150.0; // Minimum width for each grid item
    final crossAxisCount = (screenWidth / minItemWidth).floor().clamp(1, 4);

    // Calculate spacing as a percentage of screen width
    final crossAxisSpacing = screenWidth * 0.02;
    final mainAxisSpacing = screenHeight * 0.01;

    // Adjust childAspectRatio based on screen size and orientation
    final childAspectRatio = isLandscape
        ? 0.9
        : (screenWidth < 400 ? 0.5 : 0.55);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable content (cart items)
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom -
                      AppBar().preferredSize.height,
                ),
                child: Column(
                  children: [
                    cart.items.isEmpty
                        ? Container(
                      height: MediaQuery.of(context).size.height - 100,
                      child: Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 18))),
                    )
                        : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: childAspectRatio,
                      ),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 70), // Increased bottom padding for new total row height
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.asset(
                                    item.product.imagePath,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.image,
                                        size: 50,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.product.name ?? 'Unknown Product',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            item.product.brand ?? 'Unknown Brand',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '₹${(item.totalPrice ?? 0.0).toStringAsFixed(2)}',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.remove),
                                                  iconSize: 14,
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(
                                                    minWidth: 20,
                                                    minHeight: 20,
                                                  ),
                                                  onPressed: () {
                                                    onCartUpdated(cart.decreaseQuantity(index));
                                                  },
                                                ),
                                                Text(
                                                  '${item.quantity}',
                                                  style: TextStyle(fontSize: 11),
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.add),
                                                  iconSize: 14,
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(
                                                    minWidth: 20,
                                                    minHeight: 20,
                                                  ),
                                                  onPressed: () {
                                                    onCartUpdated(cart.increaseQuantity(index));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(vertical: 4.0),
                                            backgroundColor: Colors.red.withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            onCartUpdated(cart.removeProduct(index));
                                            showCenteredMessage(context, '${item.product.name ?? 'Product'} removed from cart');
                                          },
                                          child: Text(
                                            'Remove',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    if (cart.items.isNotEmpty) SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            // Updated total price row (now "Amount Price" with "Check Out" button)
            if (cart.items.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  color: Colors.white, // Changed to white to match the image
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Amount Price and Price
                      Row(
                        children: [
                          Text(
                            'Amount Price',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '₹${(cart.totalPrice ?? 0.0).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Check Out button with badge
                      Stack(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink, // Pink background
                              foregroundColor: Colors.white, // White text/icon
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Add checkout functionality here
                              showCenteredMessage(context, 'Proceeding to checkout...');
                            },
                            child: Text(
                              'Check Out',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (cart.totalItems > 0)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    '${cart.totalItems}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}