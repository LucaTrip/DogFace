import 'dart:convert';

import 'package:http/http.dart' as http;

Future<RandomDog> fetchRandomDog() async {
  var endpoint = "https://dog.ceo/api/breeds/image/random";

  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode == 200) {
    return RandomDog.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load dog');
  }
}

RandomDog randomDogFromJson(String str) => RandomDog.fromJson(json.decode(str));

String randomDogToJson(RandomDog data) => json.encode(data.toJson());

class RandomDog {
  final String message;
  final String status;

  RandomDog({
    required this.message,
    required this.status,
  });

  factory RandomDog.fromJson(Map<String, dynamic> json) => RandomDog(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
