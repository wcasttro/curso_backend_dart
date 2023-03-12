import '../models/noticia_model.dart';
import 'noticias_service.dart';
import '../utils/list_extendion.dart';




class NoticiasServiceImpl implements NoticiasService{

  List<NoticiaModel> _fakeDB = [];

  @override
  bool delete(int id) {
   _fakeDB.removeWhere((element) => element.id == id);
   return true;
  }

  @override
  List<NoticiaModel> findAll() {
    return _fakeDB;
  }

  @override
  findOne(int id) {
   _fakeDB.firstWhere((element) => element.id == id);
  }

  @override
  bool save(NoticiaModel value) {

    NoticiaModel? model = _fakeDB.fistWhereOrNull((element) => element.id == value.id);

    if(model == null){
      _fakeDB.add(value);
      
    }else{
      final index = _fakeDB.indexOf(model);
      _fakeDB[index] = value;
      

    }

   return true;
  }

}