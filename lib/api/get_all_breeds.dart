import 'dart:convert';

import 'package:http/http.dart' as http;

Future<AllBreeds> fetchAllBreeds() async {
  var endpoint = "https://dog.ceo/api/breeds/list/all";

  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode == 200) {
    return AllBreeds.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load dog');
  }
}

AllBreeds allBreedsFromJson(String str) => AllBreeds.fromJson(json.decode(str));

String allBreedsToJson(AllBreeds data) => json.encode(data.toJson());

class AllBreeds {
  final Map<String, List<String>> message;
  final String status;

  AllBreeds({
    required this.message,
    required this.status,
  });

  factory AllBreeds.fromJson(Map<String, dynamic> json) => AllBreeds(
        message: Map.from(json["message"]).map((k, v) =>
            MapEntry<String, List<String>>(
                k, List<String>.from(v.map((x) => x)))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": Map.from(message).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "status": status,
      };
}
