import 'dart:convert';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

import '../models/noticia_model.dart';
import '../services/noticias_service.dart';


class NoticiasApi{

  final NoticiasService _service;

  NoticiasApi(this._service);

  Handler get handler{
    Router router = Router();

    // pegar lista de noticias
    router.get('/blog/noticias', (Request request){
     List<NoticiaModel> noticias =  _service.findAll();
     List<Map> noticiasMap = noticias.map((e) => e.toMap()).toList();
      return Response.ok(jsonEncode(noticiasMap), headers: {"content-type":"application/json"});
    });

    // criar noticia
    router.post('/blog/noticia', (Request request) async{
      var body = await request.readAsString();
      _service.save(NoticiaModel.fromMap(jsonDecode(body)));
      return Response.ok('Adicionando noticia');
    });

    // alterar noticia?id=1
    router.put('/blog/noticia', (Request request){
      String? id = request.url.queryParameters['id'];
      return Response.ok('Alterando noticia');
    });

    // alterar delete?id=1
    router.delete('/blog/noticia', (Request request){
      String? id = request.url.queryParameters['id'];

      return Response.ok('Deletando noticia');
    });



    return router;
  }
}