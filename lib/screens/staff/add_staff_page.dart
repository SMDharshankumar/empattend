import 'package:flutter/material.dart';
import '../../data/sample_data.dart';
import '../../models/staff.dart';

class AddStaffPage extends StatefulWidget {
  const AddStaffPage({super.key});

  @override
  State<AddStaffPage> createState() => _AddStaffPageState();
}

class _AddStaffPageState extends State<AddStaffPage> {
  final nameCtrl = TextEditingController();
  final roleCtrl = TextEditingController();
  final wageCtrl = TextEditingController();

  void save() {
    staffList.add(
      Staff(
        name: nameCtrl.text,
        role: roleCtrl.text,
        dailyWage: int.parse(wageCtrl.text),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Staff")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: roleCtrl, decoration: const InputDecoration(labelText: "Role")),
            TextField(controller: wageCtrl, decoration: const InputDecoration(labelText: "Daily Wage")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: save, child: const Text("Save Staff")),
          ],
        ),
      ),
    );
  }
}
