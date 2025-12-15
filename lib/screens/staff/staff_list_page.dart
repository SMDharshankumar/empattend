import 'package:flutter/material.dart';
import '../../data/sample_data.dart';

class StaffListPage extends StatelessWidget {
  const StaffListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Staff List")),
      body: staffList.isEmpty
          ? const Center(child: Text("No staff added yet"))
          : ListView.builder(
              itemCount: staffList.length,
              itemBuilder: (_, index) {
                final staff = staffList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(staff.name),
                    subtitle: Text("${staff.role} • ₹${staff.dailyWage}/day"),
                    trailing: Chip(
                      label: Text(
                        staff.isPresent ? "Present" : "Absent",
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor:
                          staff.isPresent ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
