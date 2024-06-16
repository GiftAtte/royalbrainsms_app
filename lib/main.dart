import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalbrainsmsapp/providers/student.provider.dart';
import 'package:royalbrainsmsapp/providers/user.provider.dart';
import 'package:royalbrainsmsapp/screens/admin/admin_dashboard.screen.dart';
import 'package:royalbrainsmsapp/screens/auth/login.screen.dart';
import 'package:royalbrainsmsapp/screens/employees/teachers_dashboard.sreen.dart';
import 'package:royalbrainsmsapp/screens/parents/parent_dashboard.screen.dart';
import 'package:royalbrainsmsapp/screens/student/student_form.screen.dart';
import 'package:royalbrainsmsapp/screens/student/student_list.screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => StudentProvider()),
      ],
      child: MaterialApp(
        title: 'School Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/teacher': (context) => const TeacherDashboard(),
          '/parent': (context) => const ParentDashboard(),
          '/admin': (context) => const AdminDashboard(),
          '/students': (context) => const StudentListScreen(students: []), // Initially empty list
          '/student': (context) => const StudentForm(), // Route for adding new student
        },
      ),
    );
  }
}
