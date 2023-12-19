class Student
{
  // constructeur
  Student(this.nom, this.prenom, this.matieres, this.notes);

  // Propriétés de la classe qui seront initialisées par le constructeur
  // déclenché par la méthode factory
  final String nom;
  final String prenom;
  final List<String> matieres;
  final List<double> notes;

  // méthode factory
  // utilisée pour implémenter des logiques de création avancées, 
  //telles que la réutilisation d'instances existantes, la création d'instances 
  // de sous-classes en fonction de certains critères, etc.
  // Elle offre une flexibilité supplémentaire par rapport aux constructeurs classiques.
  factory
  Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json["nom"],
      json["prenom"],
      (json['matieres'] as List).map((e)=> e as String).toList(),
      (json['notes'] as List).map((e)=> e as double).toList(),
    );
  }

  // méthode retournant la moyenne du student
  double getAverage() {
    return getNotes.reduce((value, element) => value + element) / getNotes.length;
  }

  // getters
  String get getNom => nom;
  String get getPrenom => prenom;
  List<String> get getMatieres => matieres;
  List<double> get getNotes => notes;

}

class StudentList
{
  // constructeur
  StudentList({
    required this.students
  });

  // Propriétés de la classe qui seront initialisées par le constructeur
  final List<Student> students;
  
  // méthode factory
  // utilisée pour implémenter des logiques de création avancées, 
  //telles que la réutilisation d'instances existantes, la création d'instances 
  // de sous-classes en fonction de certains critères, etc.
  // Elle offre une flexibilité supplémentaire par rapport aux constructeurs classiques.
  factory StudentList.fromJson(List<dynamic> parsedJson) {

    List<Student> students = <Student>[];

    students = parsedJson.map((i)=>Student.fromJson(i)).toList();

    return StudentList(
      students: students,
    );
  }
}