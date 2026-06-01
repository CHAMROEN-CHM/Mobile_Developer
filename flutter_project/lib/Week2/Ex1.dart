// Exercise 1
// list of skills ussing enum

enum Skills { Flutter, Dart, Other }

// Address class
class Address {
  final String city;
  final String street;
  final String zipCode;
  // constructors
  Address(this.city, this.street, this.zipCode);
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skills> _skill = [];
  Address _address;
  int _yearOfExperient;

  // constructors
  Employee(
    this._name,
    this._baseSalary,
    this._yearOfExperient,
    this._address,
    this._skill,
  );

  // name constructor
  Employee.mobileDeveloper(String name, int yearOfExperient, Address address)
    : _name = name,
      _yearOfExperient = yearOfExperient,
      _address = address,
      _skill = [Skills.Dart, Skills.Flutter],
      _baseSalary = 4000;

  // method getSalary
  double getSalary() {
    double salary = _baseSalary;
    if (_yearOfExperient <= 0) {
      salary = 4000;
    } else {
      salary *= _yearOfExperient;
    }

    for (var i in skill) {
      if (i == Skills.Flutter) {
        salary += 5000;
      } else if (i == Skills.Dart) {
        salary += 3000;
      } else {
        salary += 1000;
      }
    }
    return salary;
  }

  // using getter
  get name => _name;
  get yearOfExperient => _yearOfExperient;
  get address => _address;
  get skill => _skill;
  get baseSalary => _baseSalary;

  String toString() {
    return "Name: ${name}\nYear of Experience: ${yearOfExperient}\nBaseSalary: ${getSalary()}\nAddress: ${address}\nSKills: ${skill}";
  }
}

void main() {
  Address add = Address("PP", "st 32", "1200");
  Employee emp1 = Employee.mobileDeveloper("Sam", 1, add);
  print(emp1);
}
