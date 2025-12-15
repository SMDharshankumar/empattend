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
    int total = staffList.length;
    int present = staffList.where((s) => s.isPresent).length;
    int absent = total - present;

    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _statBox("Total", total, Colors.blue),
                _statBox("Present", present, Colors.green),
                _statBox("Absent", absent, Colors.red),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: staffList.length,
              itemBuilder: (_, index) {
                final staff = staffList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: ListTile(
                    title: Text(staff.name),
                    subtitle: Text("₹${staff.dailyWage}/day"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChoiceChip(
                          label: const Text("Present"),
                          selected: staff.isPresent,
                          onSelected: (_) {
                            setState(() => staff.isPresent = true);
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text("Absent"),
                          selected: !staff.isPresent,
                          onSelected: (_) {
                            setState(() => staff.isPresent = false);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Attendance saved")),
                );
              },
              child: const Text("Save Daily Log"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statBox(String title, int value, Color color) {
    return Column(
      children: [
        Text(title),
        const SizedBox(height: 5),
        CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Text(
            value.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
