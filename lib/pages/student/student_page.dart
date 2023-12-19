import 'package:flutter/material.dart';
import 'package:flutter_http/components/student_lister.dart';
import 'package:flutter_http/components/student_lister_multiple.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key, required this.all});

  final bool all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(all ? 'Nos Etudiants' : 'Un Etudiant'),
      ),
      body: Flexible(
        child: all ? const StudentListerMultiple() : const StudentLister()
      )
    );
  }
}