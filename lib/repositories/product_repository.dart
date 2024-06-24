import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductRepository {
  final String apiUrl;

  const ProductRepository({required this.apiUrl});

  Stream<List<Product>> streamProducts(String category) async* {
    final response =
        await http.get(Uri.parse('$apiUrl/products?category=$category'));

    if (response.statusCode == 200) {
      final List<dynamic> productsData = json.decode(response.body);
      yield productsData
          .map<Product>((productData) => Product.fromJson(productData))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> createProducts() async {
    try {
      for (var product in products) {
        final response = await http.post(
          Uri.parse('$apiUrl/products'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(product),
        );

        if (response.statusCode != 201) {
          throw Exception('Failed to create product');
        }
      }
    } catch (err) {
      throw Exception('Failed to create the products: $err');
    }
  }
}

const products = [
  {
    "name": "Performance Running T-Shirt",
    "description":
        "Breathable and quick-drying T-shirt, ideal for long-distance running. Available in multiple colors.",
    "price": 29.99,
    "imageUrl": "https://source.unsplash.com/random/?sport,clothes",
    "category": "Sportswear",
    "stock": 200
  },
  {
    "name": "Men's Basketball Shorts",
    "description":
        "Comfortable and lightweight basketball shorts, designed for optimal movement and durability.",
    "price": 34.99,
    "imageUrl": "https://source.unsplash.com/random/?sport,clothes",
    "category": "Sportswear",
    "stock": 150
  },
  {
    "name": "Cycling Jersey",
    "description":
        "High-performance cycling jersey with moisture-wicking fabric and rear pockets for essentials.",
    "price": 45.99,
    "imageUrl": "https://source.unsplash.com/random/?sport,clothes",
    "category": "Cycling",
    "stock": 100
  },
  {
    "name": "Trail Running Shoes",
    "description":
        "Durable and supportive trail running shoes with enhanced grip for rough terrain.",
    "price": 89.99,
    "imageUrl": "https://source.unsplash.com/random/?sport,clothes",
    "category": "Footwear",
    "stock": 80
  },
  {
    "name": "Fitness Training Tracksuit",
    "description":
        "Comfortable tracksuit for fitness training, made with flexible and sweat-wicking material.",
    "price": 59.99,
    "imageUrl": "https://source.unsplash.com/random/?sport,clothes",
    "category": "Sportswear",
    "stock": 120
  }
];
