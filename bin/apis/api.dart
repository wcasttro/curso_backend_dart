import 'package:shelf/shelf.dart';

abstract class Api{

  Handler getHandler({ List<Middleware> middlewares = const []});
  Handler createHandler({required Handler router, List<Middleware> middlewares = const []}){
    var pipeline = Pipeline();

    for (var element in middlewares) {
      pipeline = pipeline.addMiddleware(element);
    }

    return pipeline.addHandler(router);
  }



}