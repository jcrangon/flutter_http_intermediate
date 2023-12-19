
import 'package:flutter_http/models/product.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService
{
  // pour chrome:
  // static String productUrl = "http://localhost:8000/products.json";

  // pour l'émulateur
  static String productUrl = "http://10.0.2.2:8000/products.json";

  static Future<ProductList?> getProducts() async {
    try {
      final response = await http.get(Uri.parse(productUrl), headers: {"Accept": "application/json"});    

      if (response.statusCode == 200) {

        if (response.body.isNotEmpty) {

          final jsonResponse = json.decode(response.body);

          final ProductList products = ProductList.fromJson(jsonResponse);

          if (products.products.isNotEmpty) {
            return products;

          } else {
            return null; // Aucun département n'a été retourné
          }

        } else {
          return null; // La réponse est vide
        }

      } else {
        throw Exception('Impossible de charger les produits1');
      }

    } catch (e) {
      print(e.toString());
      throw Exception('Impossible de charger les produits2');
    }
  }
}