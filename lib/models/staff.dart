class Staff {
  String name;
  String role;
  int dailyWage;
  bool isPresent;

  Staff({
    required this.name,
    required this.role,
    required this.dailyWage,
    this.isPresent = false,
  });
}
