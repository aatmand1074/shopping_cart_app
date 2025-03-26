import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  double? get totalPrice => product.price != null ? product.price! * quantity : null;

  CartItem({required this.product, this.quantity = 1});
}

class Cart {
  List<CartItem> items = [];

  double? get totalPrice {
    double total = 0.0;
    for (var item in items) {
      total += item.totalPrice ?? 0.0;
    }
    return total;
  }

  int get totalItems => items.length;

  Cart addProduct(Product product) {
    for (var item in items) {
      if (item.product.id == product.id) {
        item.quantity++;
        return this; // Return the Cart object
      }
    }
    items.add(CartItem(product: product));
    return this; // Return the Cart object
  }

  Cart increaseQuantity(int index) {
    if (index >= 0 && index < items.length) {
      items[index].quantity++;
    }
    return this;
  }

  Cart decreaseQuantity(int index) {
    if (index >= 0 && index < items.length) {
      if (items[index].quantity > 1) {
        items[index].quantity--;
      } else {
        items.removeAt(index);
      }
    }
    return this;
  }

  Cart removeProduct(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
    }
    return this;
  }

  void clearCart() {
    items.clear();
  }
}