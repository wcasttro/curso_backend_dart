import 'dart:convert';

class NoticiaModel {
  final int? id;
  final String title;
  final String description;
  final String? image;
  final DateTime dtPublication;
  final DateTime dtUpdate;
  NoticiaModel({
    required this.id,
    required this.title,
    required this.description,
    this.image,
    required this.dtPublication,
    required this.dtUpdate,
  });


  @override
  String toString() {
    return 'NoticaModel(id: $id, title: $title, description: $description, image: $image, dtPublication: $dtPublication, dtUpdate: $dtUpdate)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'dtPublication': dtPublication.millisecondsSinceEpoch,
      'dtUpdate': dtUpdate.millisecondsSinceEpoch,
    };
  }

  factory NoticiaModel.fromMap(Map<String, dynamic> map) {
    return NoticiaModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'],
      dtPublication: DateTime.fromMillisecondsSinceEpoch(map['dtPublication']),
      dtUpdate: DateTime.fromMillisecondsSinceEpoch(map['dtUpdate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticiaModel.fromJson(String source) => NoticiaModel.fromMap(json.decode(source));
}
