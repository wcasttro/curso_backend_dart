import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';


class BlogApi{
  Handler get handler{
    Router router = Router();

    // pegar lista de noticias
    router.get('/blog/noticias', (Request request){
      return Response.ok('Primeira noticia');
    });

    // criar noticia
    router.post('/blog/noticia', (Request request){
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