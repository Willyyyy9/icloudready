import 'package:icloudready/app/modules/home/models/character.dart';

class CharacterResponse {
  Info info;
  List<Character> characters;

  CharacterResponse({required this.info, required this.characters});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    return CharacterResponse(
      info: Info.fromJson(json['info']),
      characters: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e))
          .toList(),
    );
  }
}

class Info {
  int count;
  int pages;
  String? next;
  String? prev;

  Info(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
