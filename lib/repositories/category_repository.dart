import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryRepository {
  final String apiUrl;

  const CategoryRepository({required this.apiUrl});

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/categories'));

      if (response.statusCode == 200) {
        final List<dynamic> categoriesData = json.decode(response.body);
        return categoriesData
            .map<Category>((categoryData) => Category.fromJson(categoryData))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (err) {
      throw Exception('Failed to fetch the categories: $err');
    }
  }

  Future<void> createCategories() async {
    try {
      for (var category in categories) {
        final response = await http.post(
          Uri.parse('$apiUrl/categories'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(category),
        );

        if (response.statusCode != 201) {
          throw Exception('Failed to create category');
        }
      }
    } catch (err) {
      throw Exception('Failed to create the categories: $err');
    }
  }
}

const categories = [
  {
    "name": "Sportswear",
    "description": "This is the sportswear category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1483721310020-03333e577078?q=80&w=3097&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Cycling",
    "description": "This is the cycling category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1541625602330-2277a4c46182?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Footwear",
    "description": "This is the footwear category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1562183241-b937e95585b6?q=80&w=3505&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Accessories",
    "description": "This is the accessories category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1676312830459-f6f13dfdd899?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Watersports",
    "description": "This is the watersports category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1576610616656-d3aa5d1f4534?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Camping",
    "description": "This is the camping category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1504851149312-7a075b496cc7?q=80&w=3437&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Indoor",
    "description": "This is the indoor category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1559369064-c4d65141e408?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Golf",
    "description": "This is the golf category.",
    "imageUrl":
        "https://images.unsplash.com/photo-1587174486073-ae5e5cff23aa?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  }
];
