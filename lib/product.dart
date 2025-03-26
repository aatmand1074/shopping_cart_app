class Product {
  final int id;
  final String name;
  final String brand;
  final double price;
  final double discountedPrice;
  final int discount;
  final String description;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.discountedPrice,
    required this.discount,
    required this.description,
    required this.imagePath,
  });
}