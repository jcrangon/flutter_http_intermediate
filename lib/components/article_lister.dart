import 'package:flutter/material.dart';
import 'package:flutter_http/models/article.model.dart';
import 'package:flutter_http/services/article.service.dart';

class ArticleLister extends StatefulWidget {
  const ArticleLister({super.key});

  @override
  State<ArticleLister> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleLister> {

  late Future<ArticleList?> articles;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    setState(() {
        articles = ArticleService.getArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticleList?>(
      future: articles,
      builder: (context, snapshot) {
        // Les données sont arrivées sans erreurs
        if (snapshot.hasData) {
          // return Container();
          List<Article> articles = snapshot.data!.articles;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              Article article = articles[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // You can customize Card properties here
                  child: ListTile(
                    title: Text("${article.title} de ${article.author} - ${article.source.name}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(article.description),
                      ],
                    ),
                    // You can handle onTap here
                    onTap: () {
                      // Add your onTap logic
                    },
                  ),
                ),
              );
            },
          );
          // La requete a provoqué une erreur
        } else if(snapshot.hasError) {
          return Text("error: ${snapshot.error}");
        }

        // pas encore de données, et pas d'erreur,
        // on retourne un spinner
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}