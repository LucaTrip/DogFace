import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DogsByBreed> fetchDogsByBreed(String breed) async {
  var endpoint = "https://dog.ceo/api/breed/$breed/images";

  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode == 200) {
    return DogsByBreed.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load dog');
  }
}

DogsByBreed dogsByBreedFromJson(String str) =>
    DogsByBreed.fromJson(json.decode(str));

String dogsByBreedToJson(DogsByBreed data) => json.encode(data.toJson());

class DogsByBreed {
  final List<String> message;
  final String status;

  DogsByBreed({
    required this.message,
    required this.status,
  });

  factory DogsByBreed.fromJson(Map<String, dynamic> json) => DogsByBreed(
        message: List<String>.from(json["message"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x)),
        "status": status,
      };
}
