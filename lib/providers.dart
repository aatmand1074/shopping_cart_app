import 'package:flutter/foundation.dart';
import 'product.dart';

class MockData {
  static Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Product(
        id: 1,
        name: "Apple 12 (White, 64 GB)",
        brand: "Apple",
        price: 48900,
        discountedPrice: 48900 * (1 - 2 / 100), // Calculate: 48900 * (1 - 0.02) = 47922.0
        discount: 2,
        description: "A sleek iPhone with A14 Bionic chip, 64 GB storage, and a stunning Super Retina XDR display.",
        imagePath: 'assets/images/phone1.jpeg',
      ),
      Product(
        id: 2,
        name: "SAMSUNG Galaxy S24 Ultra",
        brand: "Samsung",
        price: 134999,
        discountedPrice: 134999 * (1 - 23 / 100), // Calculate: 134999 * (1 - 0.23) = 103949.23
        discount: 23,
        description: "Flagship Samsung phone with 200 MP camera, Snapdragon 8 Gen 3, and 120 Hz AMOLED display.",
        imagePath: 'assets/images/phone2.jpeg',
      ),
      Product(
        id: 3,
        name: "Vivo V50 5G",
        brand: "Vivo",
        price: 42999,
        discountedPrice: 42999 * (1 - 13 / 100), // Calculate: 42999 * (1 - 0.13) = 37409.13
        discount: 13,
        description: "Mid-range 5G phone with a 50 MP camera, AMOLED display, and fast charging support.",
        imagePath: 'assets/images/phone3.jpeg',
      ),
      Product(
        id: 4,
        name: "OnePlus Nord CE4 lite 5G",
        brand: "OnePlus",
        price: 20999,
        discountedPrice: 20999 * (1 - 18 / 100), // Calculate: 20999 * (1 - 0.18) = 17219.18
        discount: 18,
        description: "Affordable 5G phone with Snapdragon 695, 120 Hz display, and 5000 mAh battery.",
        imagePath: 'assets/images/phone4.jpeg',
      ),
      Product(
        id: 5,
        name: "IQOO Z9s 5G",
        brand: "IQOO",
        price: 25999,
        discountedPrice: 25999 * (1 - 20 / 100), // Calculate: 25999 * (1 - 0.20) = 20799.20
        discount: 20,
        description: "Gaming-focused phone with Dimensity 7300, 144 Hz AMOLED display, and 44W fast charging.",
        imagePath: 'assets/images/phone5.jpeg',
      ),
      Product(
        id: 6,
        name: "Google Pixel 8 Pro",
        brand: "Google",
        price: 89999,
        discountedPrice: 89999 * (1 - 15 / 100), // Calculate: 89999 * (1 - 0.15) = 76499.15
        discount: 15,
        description: "Premium Pixel phone with Tensor G3 chip, 50 MP camera, and AI-powered features.",
        imagePath: 'assets/images/phone6.jpeg',
      ),
      Product(
        id: 7,
        name: "Xiaomi 14 Ultra",
        brand: "Xiaomi",
        price: 79999,
        discountedPrice: 79999 * (1 - 10 / 100), // Calculate: 79999 * (1 - 0.10) = 71999.10
        discount: 10,
        description: "High-end Xiaomi phone with Leica camera, Snapdragon 8 Gen 3, and 90W fast charging.",
        imagePath: 'assets/images/phone7.jpeg',
      ),
      Product(
        id: 8,
        name: "OPPO Find X7",
        brand: "OPPO",
        price: 64999,
        discountedPrice: 64999 * (1 - 12 / 100), // Calculate: 64999 * (1 - 0.12) = 57199.12
        discount: 12,
        description: "Flagship OPPO phone with 100W fast charging, 50 MP triple camera, and AMOLED display.",
        imagePath: 'assets/images/phone8.jpeg',
      ),
      Product(
        id: 9,
        name: "Realme GT 6",
        brand: "Realme",
        price: 39999,
        discountedPrice: 39999 * (1 - 25 / 100), // Calculate: 39999 * (1 - 0.25) = 29999.25
        discount: 25,
        description: "Performance-driven phone with Snapdragon 8s Gen 3, 120 Hz display, and 50 MP camera.",
        imagePath: 'assets/images/phone9.jpeg',
      ),
      Product(
        id: 10,
        name: "Motorola Edge 50 Pro",
        brand: "Motorola",
        price: 34999,
        discountedPrice: 34999 * (1 - 20 / 100), // Calculate: 34999 * (1 - 0.20) = 27999.20
        discount: 20,
        description: "Stylish Motorola phone with 144 Hz OLED display, 50 MP camera, and 125W fast charging.",
        imagePath: 'assets/images/phone10.jpeg',
      ),
      Product(
        id: 11,
        name: "Nothing Phone (2)",
        brand: "Nothing",
        price: 44999,
        discountedPrice: 44999 * (1 - 18 / 100), // Calculate: 44999 * (1 - 0.18) = 36899.18
        discount: 18,
        description: "Unique transparent design with Glyph interface, Snapdragon 8+ Gen 1, and 120 Hz display.",
        imagePath: 'assets/images/phone11.jpeg',
      ),
      Product(
        id: 12,
        name: "Poco F6 5G",
        brand: "Poco",
        price: 29999,
        discountedPrice: 29999 * (1 - 22 / 100), // Calculate: 29999 * (1 - 0.22) = 23399.22
        discount: 22,
        description: "Budget gaming phone with Snapdragon 8s Gen 3, 90W fast charging, and 120 Hz AMOLED.",
        imagePath: 'assets/images/phone12.jpeg',
      ),
      Product(
        id: 13,
        name: "Redmi Note 13 Pro",
        brand: "Redmi",
        price: 27999,
        discountedPrice: 27999 * (1 - 15 / 100), // Calculate: 27999 * (1 - 0.15) = 23799.15
        discount: 15,
        description: "Mid-range Redmi phone with 200 MP camera, 120 Hz AMOLED display, and 67W fast charging.",
        imagePath: 'assets/images/phone13.jpeg',
      ),
      Product(
        id: 14,
        name: "Samsung Galaxy A55",
        brand: "Samsung",
        price: 38999,
        discountedPrice: 38999 * (1 - 17 / 100), // Calculate: 38999 * (1 - 0.17) = 32369.17
        discount: 17,
        description: "Mid-range Samsung phone with Exynos 1480, 50 MP camera, and 120 Hz Super AMOLED display.",
        imagePath: 'assets/images/phone14.jpeg',
      ),
      Product(
        id: 15,
        name: "iPhone 15 Pro Max",
        brand: "Apple",
        price: 159999,
        discountedPrice: 159999 * (1 - 5 / 100), // Calculate: 159999 * (1 - 0.05) = 151999.05
        discount: 5,
        description: "Top-tier iPhone with A17 Pro chip, 48 MP camera, and 6.7-inch Super Retina XDR display.",
        imagePath: 'assets/images/phone15.jpeg',
      ),
      Product(
        id: 16,
        name: "OnePlus 12",
        brand: "OnePlus",
        price: 69999,
        discountedPrice: 69999 * (1 - 10 / 100), // Calculate: 69999 * (1 - 0.10) = 62999.10
        discount: 10,
        description: "Flagship OnePlus phone with Snapdragon 8 Gen 3, 100W fast charging, and 120 Hz display.",
        imagePath: 'assets/images/phone16.jpeg',
      ),
      Product(
        id: 17,
        name: "Vivo X100 Pro",
        brand: "Vivo",
        price: 89999,
        discountedPrice: 89999 * (1 - 8 / 100), // Calculate: 89999 * (1 - 0.08) = 82799.08
        discount: 8,
        description: "Premium Vivo phone with Dimensity 9300, 50 MP Zeiss camera, and 120 Hz AMOLED display.",
        imagePath: 'assets/images/phone17.jpeg',
      ),
      Product(
        id: 18,
        name: "Oppo Reno 11",
        brand: "OPPO",
        price: 37999,
        discountedPrice: 37999 * (1 - 14 / 100), // Calculate: 37999 * (1 - 0.14) = 32679.14
        discount: 14,
        description: "Mid-range OPPO phone with 50 MP camera, 67W fast charging, and 120 Hz AMOLED display.",
        imagePath: 'assets/images/phone18.jpeg',
      ),
      Product(
        id: 19,
        name: "Realme 12 Pro+",
        brand: "Realme",
        price: 32999,
        discountedPrice: 32999 * (1 - 20 / 100), // Calculate: 32999 * (1 - 0.20) = 26399.20
        discount: 20,
        description: "Mid-range Realme phone with 64 MP periscope camera, 120 Hz display, and 67W charging.",
        imagePath: 'assets/images/phone19.jpeg',
      ),
      Product(
        id: 20,
        name: "IQOO Neo 9 Pro",
        brand: "IQOO",
        price: 36999,
        discountedPrice: 36999 * (1 - 16 / 100), // Calculate: 36999 * (1 - 0.16) = 31079.16
        discount: 16,
        description: "Performance phone with Snapdragon 8 Gen 2, 144 Hz display, and 120W fast charging.",
        imagePath: 'assets/images/phone20.jpeg',
      ),
    ];
  }
}