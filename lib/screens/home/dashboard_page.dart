import 'package:flutter/material.dart';
import '../../data/sample_data.dart';
import '../attendance/attendance_page.dart';
import '../staff/add_staff_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    int present =
        staffList.where((s) => s.isPresent).length;
    int salary = staffList
        .where((s) => s.isPresent)
        .fold(0, (sum, s) => sum + s.dailyWage);

    return Scaffold(
      appBar: AppBar(title: const Text("WageWise Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Total Staff: ${staffList.length}"),
            Text("Present Today: $present"),
            Text("Today's Salary: ₹$salary"),
            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Add Staff"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddStaffPage()),
              ),
            ),
            ElevatedButton(
              child: const Text("Mark Attendance"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AttendancePage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
