import 'package:flutter/material.dart';
import 'package:royalbrainsmsapp/components/app_button.component.dart';
import 'package:royalbrainsmsapp/components/app_input.component.dart';
import 'package:royalbrainsmsapp/models/student.model.dart';


class StudentForm extends StatefulWidget {
  final Student? student;

  const StudentForm({Key? key, this.student}) : super(key: key);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController parentNameController = TextEditingController();
  final TextEditingController parentEmailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      nameController.text = widget.student!.name;
      ageController.text = widget.student!.age.toString();
      gradeController.text = widget.student!.grade;
      parentNameController.text = widget.student!.parentName;
      parentEmailController.text = widget.student!.parentEmail;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppInput(
              controller: nameController,
              hintText: 'Name',
            ),
            const SizedBox(height: 16),
            AppInput(
              controller: ageController,
              hintText: 'Age',
           
            ),
            const SizedBox(height: 16),
            AppInput(
              controller: gradeController,
              hintText: 'Grade',
            ),
            const SizedBox(height: 16),
            AppInput(
              controller: parentNameController,
              hintText: 'Parent Name',
            ),
            const SizedBox(height: 16),
            AppInput(
              controller: parentEmailController,
              hintText: 'Parent Email',
            ),
            const SizedBox(height: 16),
            AppButton(
              text: widget.student == null ? 'Add' : 'Update',
              onPressed: () {
                // Handle form submission
              },
            ),
          ],
        ),
      ),
    );
  }
}
