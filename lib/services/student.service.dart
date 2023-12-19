
import 'package:flutter_http/models/student.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentService
{
  // pour chrome:
  // static String productUrl = "http://localhost:8000/student.json";

  // pour l'émulateur
  static String studentUrl = "http://10.0.2.2:8000/student.json";

  static Future<Student?> getStudent() async {
    try {
      final response = await http.get(Uri.parse(studentUrl), headers: {"Accept": "application/json"});    

      if (response.statusCode == 200) {

        if (response.body.isNotEmpty) {

          final jsonResponse = json.decode(response.body);

          final Student student = Student.fromJson(jsonResponse);

          return student;

        } else {
          return null; // La réponse est vide (on a mis un ? à 'static Future<Student?> ...'  pour pouvoir renvoyer un null)
        }

      } else {
        throw Exception('Impossible de charger le student1');
      }

    } catch (e) {
      print(e.toString());
      throw Exception('Impossible de charger le student2');
    }
  }

  // pour chrome:
  // static String productUrl = "http://localhost:8000/students.json";

  // pour l'émulateur
  static String articleUrl = "http://10.0.2.2:8000/students.json";

  static Future<StudentList?> getStudents() async {
    try {
      final response = await http.get(Uri.parse(articleUrl), headers: {"Accept": "application/json"});    

      if (response.statusCode == 200) {

        if (response.body.isNotEmpty) {

          final jsonResponse = json.decode(response.body);

          final StudentList students = StudentList.fromJson(jsonResponse);

          if (students.students.isNotEmpty) {
            return students;

          } else {
            return null; // Aucun département n'a été retourné
          }

        } else {
          return null; // La réponse est vide
        }

      } else {
        throw Exception('Impossible de charger les students1');
      }

    } catch (e) {
      print(e.toString());
      throw Exception('Impossible de charger les students2');
    }
  }
}