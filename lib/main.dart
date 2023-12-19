import 'package:flutter/material.dart';
import 'package:flutter_http/pages/article/article_page.dart';
import 'package:flutter_http/pages/product/product_page.dart';
import 'package:flutter_http/pages/student/student_page.dart';

void main() {
  runApp(const MyApp());
}

// lancer dans le terminal le server web:
// > http-server . --cors -p 8000

// Product.json:
// analyse de la forme des données entrantes:
// on a un e List<Map<String,dynamic>>
// donc un tableau d'objets.

// on commence par modeliser les élements les plus imbriqués.
// On commencera donc avec un classe Product
// puis on créera un classe List<Product>


// articles.json
// on identifie dans article.json on trouve un objet de type:
// <Map<String, dynamic> contenant une propriété article contenant
// un objet de type list<article>
// chaque article de la liste contient un objet unique Source de type
// Map<String, dynamic>
// on devra donc creer un objet Source, un objet Article puis un objet List<article>


// students - ONE
// Le json ne contient qu'une Map<String, dynamic>
// les champs 'Matieres' et 'Notes' contiennent une List 
// mais pas d'objets dans la liste. la récupération sera plus
// facile dans ce cas

// students - ALL
// le json contient une LIST<Student>
// il nous faudra donc dconstruire une classe StudentList pour 
// récuperer la liste des étudiants.



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Http Class'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) 
                    => const ProductPage()
                  )
                );
              }, 
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(300))
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Products"),
                  Icon(Icons.arrow_forward_ios_rounded)
                  
                ],
              ),
            ),



            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) 
                    => const StudentPage(all: false,)
                  )
                );
              }, 
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(300))
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Students - ONE"),
                  Icon(Icons.arrow_forward_ios_rounded)
                  
                ],
              ),
            ),


            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) 
                    => const StudentPage(all: true)
                  )
                );
              }, 
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(300))
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Students - ALL"),
                  Icon(Icons.arrow_forward_ios_rounded)
                  
                ],
              ),
            ),



            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) 
                    => const ArticlePage()
                  )
                );
              }, 
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(300))
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Articles"),
                  Icon(Icons.arrow_forward_ios_rounded)
                  
                ],
              ),
            ),


            


          ],
        ),
      ),
    );
  }
}
