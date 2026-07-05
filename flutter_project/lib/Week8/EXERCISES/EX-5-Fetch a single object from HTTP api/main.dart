import 'dart:convert' as convert show jsonDecode;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Geo {
  String lat;
  String lng;
  Geo(this.lat, this.lng);


  static Geo fromJson(Map<String, dynamic> json) {
    const String latKey = 'lat';
    const String lngKey = 'lng';

    assert(json[latKey] is String);
    assert(json[lngKey] is String);

    String lat = json['lat'];
    String lng = json['lng'];

    return Geo(lat, lng);
  }

  @override
  String toString() {
    return "$lat , $lng";
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;
  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  static Address fromJson(Map<String, dynamic> json) {
    const String streetKey = 'street';
    const String suiteKey = 'suite';
    const String cityKey = 'city';
    const String zipcodekey = 'zipcode';
    const String geokey = 'geo';

    assert(json[streetKey] is String);
    assert(json[suiteKey] is String);
    assert(json[cityKey] is String);
    assert(json[zipcodekey] is String);
    assert(json[geokey] is Map<String, dynamic>);

    String street = json['street'];
    String suite = json['suite'];
    String city = json['city'];
    String zipcode = json['zipcode'];
    Geo geo = Geo.fromJson(json[geokey]);

    return Address(street, suite, city, zipcode, geo);
  }

  @override
  String toString() {
    return "$street, $city, $suite, $zipcode, $geo";
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;
  Company(this.name, this.catchPhrase, this.bs);
  static Company fromJson(Map<String, dynamic> json) {
    const String nameKey = 'name';
    const String catchPhraseKey = 'catchPhrase';
    const String bskey = 'bs';
    assert(json[nameKey] is String);
    assert(json[catchPhraseKey] is String);
    assert(json[bskey] is String);
    String name = json['name'];
    String catchPhrase = json['catchPhrase'];
    String bs = json['bs'];
    return Company(name, catchPhrase, bs);
  }

  @override
  String toString() {
    return "$name, $catchPhrase, $bs";
  }
}

class User {
  Address address;
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;
  Company company;
  User(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  );

  static User fromJson(Map<String, dynamic> json) {
    const String idKey = 'id';
    const String nameKey = 'name';
    const String usernamekey = 'username';
    const String emailkey = 'email';
    const String phonekey = 'phone';
    const String websitekey = 'website';
    const String addresskey = 'address';
    const String companykey = 'company';

    assert(json[idKey] is int);
    assert(json[nameKey] is String);
    assert(json[usernamekey] is String);
    assert(json[emailkey] is String);
    assert(json[phonekey] is String);
    assert(json[addresskey] is Map<String, dynamic>);
    assert(json[companykey] is Map<String, dynamic>);

    int id = json[idKey];
    String name = json[nameKey];
    String username = json[usernamekey];
    String email = json[emailkey];
    String phone = json[phonekey];
    String website = json[websitekey];
    Company company = Company.fromJson(json[companykey]);
    Address address = Address.fromJson(json[addresskey]);

    return User(id, name, username, email, address, phone, website, company);
  }

  @override
  String toString() {
    return "User:\nID: $id\nName: $name\nUsername: $username\nEmail: $email\nAddress: $address\nPhone: $phone\nWebsite: $website\nCompany: $company";
  }
}

void main() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

  // 1- Get the request response
  Response response = await http.get(url);

  // 2- Check the responsae status
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
  }

  Map<String, dynamic> json = convert.jsonDecode(response.body);
  User u1 = User.fromJson(json);
  print(u1);
}
