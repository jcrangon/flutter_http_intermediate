import 'package:flutter/material.dart';
import 'package:flutter_http/models/student.model.dart';
import 'package:flutter_http/services/student.service.dart';

class StudentLister extends StatefulWidget {
  const StudentLister({super.key});

  @override
  State<StudentLister> createState() => _StudentListerListState();
}

class _StudentListerListState extends State<StudentLister> {

  late Future<Student?> student;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
    setState(() {
        student = StudentService.getStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Student?>(
      future: student,
      builder: (context, snapshot) {
        // Les données sont arrivées sans erreurs
        if (snapshot.hasData) {
          // return Container();
          Student student = snapshot.data!;
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // You can customize Card properties here
                  child: ListTile(
                    title: Text("${student.nom} ${student.prenom}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Matiere(s) étudiée(s): ${student.matieres.join(',')}"),
                        Text("Moyenne générale (/20): ${student.getAverage()}"),
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