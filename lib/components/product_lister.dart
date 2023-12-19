import 'package:flutter/material.dart';
import 'package:flutter_http/models/product.model.dart';
import 'package:flutter_http/services/product.service.dart';

class ProductLister extends StatefulWidget {
  const ProductLister({super.key});

  @override
  State<ProductLister> createState() => _ProductListState();
}

class _ProductListState extends State<ProductLister> {

  late Future<ProductList?> products;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    setState(() {
        products = ProductService.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductList?>(
      future: products,
      builder: (context, snapshot) {
        // Les données sont arrivées sans erreurs
        if (snapshot.hasData) {
          // return Container();
          List<Product> products = snapshot.data!.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = products[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // You can customize Card properties here
                  child: ListTile(
                    leading: Image.asset(
                      "web/assets/img/${product.image}",
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.description),
                        Text('\$${product.price}'),
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