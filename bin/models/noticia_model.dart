class NoticaModel {
  final int id;
  final String title;
  final String description;
  final String? image;
  final DateTime dtPublication;
  final DateTime dtUpdate;
  NoticaModel({
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
}
