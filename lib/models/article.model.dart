class Source
{
  // constructeuer
  Source(this.id, this.name);

  // Propriétés de la classe qui seront initialisées par le constructeur
  final int? id;
  final String name;

  // méthode factory
  // utilisée pour implémenter des logiques de création avancées, 
  //telles que la réutilisation d'instances existantes, la création d'instances 
  // de sous-classes en fonction de certains critères, etc.
  // Elle offre une flexibilité supplémentaire par rapport aux constructeurs classiques.
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      json["id"],
      json["name"],
    );
  }

  // getters
  int? get getId => id;
  String get getName => name;
}

class Article 
{
  // constructeur
  Article(this.source, this.author, this.title, this.description);

  // Propriétés de la classe qui seront initialisées par le constructeur
  // déclenché par la méthode factory
  final Source source;
  final String author;
  final String title;
  final String description;


  // méthode factory
  // utilisée pour implémenter des logiques de création avancées, 
  //telles que la réutilisation d'instances existantes, la création d'instances 
  // de sous-classes en fonction de certains critères, etc.
  // Elle offre une flexibilité supplémentaire par rapport aux constructeurs classiques.
  factory
  Article.fromJson(Map<String, dynamic> json) {
    return Article(
      Source.fromJson(json["source"]),
      json["author"],
      json["title"],
      json["description"],
    );
  }

  // getters
  Source get getSource => source;
  String get getAuthor => author;
  String get getTitle => title;
  String get getDescription => description;
}

class ArticleList
{
  // constructeur
  ArticleList({
    required this.articles
  });

  // Propriétés de la classe qui seront initialisées par le constructeur
  final List<Article> articles;
  
  // méthode factory
  // utilisée pour implémenter des logiques de création avancées, 
  //telles que la réutilisation d'instances existantes, la création d'instances 
  // de sous-classes en fonction de certains critères, etc.
  // Elle offre une flexibilité supplémentaire par rapport aux constructeurs classiques.
  factory ArticleList.fromJson(List<dynamic> parsedJson) {

    List<Article> articles = <Article>[];

    articles = parsedJson.map((i)=>Article.fromJson(i)).toList();

    return ArticleList(
      articles: articles,
    );
  }
}