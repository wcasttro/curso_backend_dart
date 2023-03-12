abstract class NoticiasService<T>{

  T findOne(int id);
  List<T> findAll();
  bool save(T save);
  bool delete(int id);
}