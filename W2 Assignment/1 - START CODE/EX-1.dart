enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address,
      this._yearsOfExperience);

  Employee.mobileDeveloper(this._name, this._baseSalary, this._address,
      this._yearsOfExperience)
      : _skills = [Skill.FLUTTER, Skill.DART];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = _baseSalary + _yearsOfExperience * 2000;
    for (final skill in _skills) {
      if (skill == Skill.FLUTTER) salary += 5000;
      if (skill == Skill.DART) salary += 3000;
      if (skill == Skill.OTHER) salary += 1000;
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $_name, Salary: \$${computeSalary()}');
  }
}

void main() {
  // test
  final address = Address('Street 1', 'Phnom Penh', '12000');
  final emp1 = Employee.mobileDeveloper('Sokea', 40000, address, 2);
  emp1.printDetails();

  final emp2 = Employee('Ronan', 45000, [Skill.DART], address, 3);
  emp2.printDetails();
}
