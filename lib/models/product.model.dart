class Product {
  // constructeur
  Product(this.name, this.description, this.price, this.image);

  // Propriétés de la classe qui seront initialisées par le constructeur
  // déclenché par la méthode factory
  final String name;
  final String description;
  final int price;
  final String image;

  // méthode factory
  // utilisée pour implémenter des logiques de création avancées, 
  //telles que la réutilisation d'instances existantes, la création d'instances 
  // de sous-classes en fonction de certains critères, etc.
  // Elle offre une flexibilité supplémentaire par rapport aux constructeurs classiques.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
    json['name'],
    json['description'],
    json['price'],
    json['image'],
    );
  }

  // getters
  String get getName => name;
  String get getDescription => description;
  int get getPrice => price;
  String get getImage => image;
}

class ProductList
{
  // constructeur
  ProductList({
    required this.products
  });

  // Propriétés de la classe qui seront initialisées par le constructeur
  final List<Product> products;
  
  // méthode factory
  // utilisée pour implémenter des logiques de création avancées, 
  //telles que la réutilisation d'instances existantes, la création d'instances 
  // de sous-classes en fonction de certains critères, etc.
  // Elle offre une flexibilité supplémentaire par rapport aux constructeurs classiques.
  factory ProductList.fromJson(List<dynamic> parsedJson) {

    List<Product> products = <Product>[];

    products = parsedJson.map((i)=>Product.fromJson(i)).toList();

    return ProductList(
      products: products,
    );
  }
}