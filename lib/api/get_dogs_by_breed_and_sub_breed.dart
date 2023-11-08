import 'dart:convert';
import 'package:http/http.dart' as http;

Future<DogsByBreedAndSubBreed> fetchDogsByBreedAndSubBreed(
    String breed, String subBreed) async {
  var endpoint = "https://dog.ceo/api/breed/$breed/$subBreed/images";

  final response = await http.get(Uri.parse(endpoint));

  if (response.statusCode == 200) {
    return DogsByBreedAndSubBreed.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load dog');
  }
}

DogsByBreedAndSubBreed dogsByBreedAndSubBreedFromJson(String str) =>
    DogsByBreedAndSubBreed.fromJson(json.decode(str));

String dogsByBreedAndSubBreedToJson(DogsByBreedAndSubBreed data) =>
    json.encode(data.toJson());

class DogsByBreedAndSubBreed {
  final List<String> message;
  final String status;

  DogsByBreedAndSubBreed({
    required this.message,
    required this.status,
  });

  factory DogsByBreedAndSubBreed.fromJson(Map<String, dynamic> json) =>
      DogsByBreedAndSubBreed(
        message: List<String>.from(json["message"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x)),
        "status": status,
      };
}
