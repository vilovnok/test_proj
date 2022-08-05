import 'dart:convert';

import 'package:http/http.dart' as http;

class OfficesList {
  List<Office> offices;
  OfficesList({required this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List;

    List<Office> officesList =
        officesJson.map((i) => Office.fromJson(i)).toList();

    return OfficesList(offices: officesList);
  }
}

class Office {
  final String? addres;
  final String? id;
  final String? image;
 
  final String? name;
  final String? phone;
  final String? region;
  Office(
      {required this.addres,
      required this.id,
      required this.image,
   
      required this.name,
      required this.phone,
      required this.region});

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
        addres: json['addres'],
        id: json['id'],
        image: json['image'],
    
        name: json['name'],
        phone: json['phone'],
        region: json['region']);
  }
}

Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error ${response.reasonPhrase}');
  }
}
