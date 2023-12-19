

import 'package:flutter_http/models/article.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleService
{
  // pour chrome:
  // static String productUrl = "http://localhost:8000/articles.json";

  // pour l'émulateur
  static String articleUrl = "http://10.0.2.2:8000/articles.json";

  static Future<ArticleList?> getArticles() async {
    try {
      final response = await http.get(Uri.parse(articleUrl), headers: {"Accept": "application/json"});    

      if (response.statusCode == 200) {

        if (response.body.isNotEmpty) {

          final jsonResponse = json.decode(response.body);

          final ArticleList articles = ArticleList.fromJson(jsonResponse["articles"]);

          if (articles.articles.isNotEmpty) {
            return articles;

          } else {
            return null; // Aucun département n'a été retourné
          }

        } else {
          return null; // La réponse est vide
        }

      } else {
        throw Exception('Impossible de charger les articles1');
      }

    } catch (e) {
      print(e.toString());
      throw Exception('Impossible de charger les articles2');
    }
  }
}