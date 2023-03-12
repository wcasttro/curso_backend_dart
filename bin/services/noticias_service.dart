import '../models/noticia_model.dart';

abstract class NoticiasService<T>{

  T findOne(int id);
  List<NoticiaModel> findAll();
  bool save(NoticiaModel save);
  bool delete(int id);
}