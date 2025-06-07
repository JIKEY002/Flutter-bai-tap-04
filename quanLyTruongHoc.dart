// === 1. Lớp Person (Cha) ===
class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

// === 2. Lớp Student ===
class Student extends Person {
  String grade;
  List<double> scores = [];

  Student(String id, String name, int age, String gender, this.grade)
    : super(id, name, age, gender);

  double get averageScore {
    if (scores.isEmpty) return 0.0;
    return scores.reduce((a, b) => a + b) / scores.length;
  }

  void displayInfo() {
    print(
      'Student ID: $id | Name: $name | Age: $age | Gender: $gender | Grade: $grade',
    );
    print('Scores: $scores | Average: ${averageScore.toStringAsFixed(2)}');
  }
}

// === 3. Lớp Teacher ===
class Teacher extends Person {
  String subject;
  double salary;

  Teacher(
    String id,
    String name,
    int age,
    String gender,
    this.subject,
    this.salary,
  ) : super(id, name, age, gender);

  void displayInfo() {
    print(
      'Teacher ID: $id | Name: $name | Age: $age | Gender: $gender | Subject: $subject | Salary: \$${salary.toStringAsFixed(2)}',
    );
  }
}

// === 4. Lớp Classroom ===
class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  void addStudent(Student student) {
    students.add(student);
  }

  void assignTeacher(Teacher t) {
    teacher = t;
  }

  void displayReport() {
    print('\n========== CLASSROOM REPORT ==========');
    print('Classroom ID: $id | Name: $name');
    if (teacher != null) {
      print(
        'Assigned Teacher: ${teacher!.name} - Subject: ${teacher!.subject}',
      );
    } else {
      print('No teacher assigned.');
    }

    print('\n-- Students List --');
    if (students.isEmpty) {
      print('No students in this class.');
    } else {
      for (var student in students) {
        student.displayInfo();
        print('----------------------------------');
      }
    }
    print('=====================================\n');
  }
}

// === 5. Main Program ===
void main() {
  // Danh sách toàn trường
  List<Student> allStudents = [];
  List<Teacher> allTeachers = [];
  List<Classroom> allClassrooms = [];

  // Tạo giáo viên
  var teacher1 = Teacher('T01', 'Mr. Smith', 40, 'Male', 'Math', 1200.0);
  var teacher2 = Teacher('T02', 'Ms. Jane', 35, 'Female', 'English', 1100.0);
  allTeachers.addAll([teacher1, teacher2]);

  // Tạo học sinh
  var student1 = Student('S01', 'Alice', 16, 'Female', '10A');
  student1.scores.addAll([8.5, 9.0, 7.5]);
  var student2 = Student('S02', 'Bob', 15, 'Male', '10A');
  student2.scores.addAll([6.0, 7.0, 8.0]);
  var student3 = Student('S03', 'Charlie', 16, 'Male', '10B');
  student3.scores.addAll([9.0, 9.5, 9.0]);
  allStudents.addAll([student1, student2, student3]);

  // Tạo lớp học
  var classA = Classroom('C01', '10A');
  var classB = Classroom('C02', '10B');
  allClassrooms.addAll([classA, classB]);

  // Gán giáo viên và học sinh vào lớp
  classA.assignTeacher(teacher1);
  classA.addStudent(student1);
  classA.addStudent(student2);

  classB.assignTeacher(teacher2);
  classB.addStudent(student3);

  // Hiển thị báo cáo
  for (var classroom in allClassrooms) {
    classroom.displayReport();
  }
}
