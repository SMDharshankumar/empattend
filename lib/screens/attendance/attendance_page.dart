import 'package:flutter/material.dart';
import '../../data/sample_data.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView.builder(
        itemCount: staffList.length,
        itemBuilder: (_, i) {
          final staff = staffList[i];
          return ListTile(
            title: Text(staff.name),
            subtitle: Text("₹${staff.dailyWage}/day"),
            trailing: Switch(
              value: staff.isPresent,
              onChanged: (v) {
                setState(() => staff.isPresent = v);
              },
            ),
          );
        },
      ),
    );
  }
}
