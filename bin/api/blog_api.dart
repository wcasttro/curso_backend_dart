import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';


class BlogApi{
  Handler get handler{
    Router router = Router();

    router.get('blog/noticias', (Request request){
      return Response.ok('Primeira noticia');

    });

    return router;
  }
}