import 'package:flutter/material.dart';
import 'package:flutter_http/components/article_lister.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Nos Articles"),
      ),
      body: const Flexible(
        child: ArticleLister(),
      )
    );
  }
}